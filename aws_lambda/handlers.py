from test_pipe_funcs import *
from utils import downloadS3File, replaceAccents, getMax
import pandas as pd
import numpy as np
from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.model_selection import train_test_split
from sklearn.externals import joblib
import os
import warnings # Silent warnings
import json
import base64

def getFeatures(department):
    warnings.filterwarnings("ignore")
    
    
    modelPklPath = downloadS3File(os.environ.get('BUCKET_NAME'), os.environ.get('PKL_XGBOOST'))
    prePklPath   = downloadS3File(os.environ.get('BUCKET_NAME'), os.environ.get('PKL_PRE'))
    csvPath      = downloadS3File(os.environ.get('BUCKET_NAME'), os.environ.get('TEST_DATASET_V4'))
    shapleyPath  = downloadS3File(os.environ.get('BUCKET_NAME'), os.environ.get('SHAPLEY_VALUES'))
    
    shap_values = np.load(shapleyPath)
    df_test     = pd.read_csv(csvPath, sep=';')
    pipe        = joblib.load(prePklPath)
    xg          = joblib.load(modelPklPath)
    
    df_test = pipe.transform(df_test)
    
    probs_pred = xg.predict_proba(df_test)[:,1]
    
    pipe_types = ['pass_bin','pass_num','dummie','dummie_nan']
    df_normalization = extract_normalization(pipe,df_test,pipe_types)
    for i, col in enumerate(df_test.columns):
        df_test[col] = (df_test[col]*df_normalization.loc['std',col])+df_normalization.loc['mean',col]
    
    shap_values = pd.DataFrame(shap_values,columns=df_test.columns,index=df_test.index)
    
    depto_filtered = department
    filter_dept = df_test['ESTU_DEPTO_RESIDE_{}'.format(depto_filtered)] == 1.0
    shap_values = shap_values[filter_dept]
    print(shap_values.shape)
    df_test = df_test[filter_dept]
    print(df_test.shape)
    probs_pred = probs_pred[filter_dept]
    print(probs_pred.shape)
    
    final_features = []

    for i in range(5):
        filter_prob = np.logical_and(i*0.2<probs_pred, probs_pred<=(i*0.2)+0.2)
        temp_features = pd.DataFrame()    
        features_relevants = shap_values[filter_prob].abs().sum().sort_values(ascending=False).head(6)
        features_relevants = features_relevants[[depto_filtered not in i for i in features_relevants.index]]
        
        temp_features['feature'] = features_relevants.index
        temp_features['value'] = features_relevants.tolist()
        temp_features['quintile'] = i
        
        final_features.append(temp_features)
    
    final_features = pd.concat(final_features, ignore_index=True)
    final_features = final_features.groupby('feature').apply(getMax)
    final_features['normalized_value'] = final_features['value'] / final_features['normalized_value']
    
    print(final_features.head())
    
    return {'data': final_features.to_json(orient='index')}
    
def predict(model, filename=''):
    warnings.filterwarnings("ignore")
    
    modelPklPath = downloadS3File(os.environ.get('BUCKET_NAME'), os.environ.get(model))
    prePklPath   = downloadS3File(os.environ.get('BUCKET_NAME'), os.environ.get('PKL_PRE'))
    
    if filename == '':
        filename=os.environ.get('TEST_DATASET_V4')
    else:
        filename= 'public-datasets/'+filename
        
    csvPath = downloadS3File(os.environ.get('BUCKET_NAME'), filename)
    df_devel = pd.read_csv(csvPath,sep=';')
    
    pipe = joblib.load(prePklPath)
    
    df_devel = pipe.transform(df_devel)

    pipeModel = joblib.load(modelPklPath)
    output = pipeModel.predict(df_devel)
    df_output = pd.DataFrame(data=output, columns=["score"])
    return {'data': df_output.to_json(orient='index')}

def predictCustom(data):
    
    warnings.filterwarnings("ignore")
    
    pklPath = downloadS3File(os.environ.get('BUCKET_NAME'), os.environ.get('PKL_XGBOOST'))
    
    # print('Data: ')
    # print(data)
    print(json.loads(data))
    df_all = pd.DataFrame.from_dict(data)
    
    pipe = joblib.load(pklPath)
    output = pipe.predict(df_all)
    print(output)
    return {'data': pd.Series(output).to_json(orient='index')}