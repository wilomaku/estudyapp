import json
from handlers import *
def lambda_handler(event, context):
    
    apiPath = event['rawPath']
    body = event['body']
    print('Body')
    print(body)
    print('Fin Body')
    filename = ''
    department = 'BOGOTA'
    if 'filename' in body:
        filename = body.split('=')[-1]
    elif 'department' in body:
        department = body.split('=')[-1]
    bodyResponse = {}
    
    if apiPath == '/predictXgboost':
        bodyResponse = predict('PKL_XGBOOST')
    elif apiPath == '/getFeatures':
        bodyResponse = getFeatures(department)
    elif apiPath == '/predictLinear':
        bodyResponse = predict('PKL_LINEAR', filename)
        
    return {
        'statusCode': 200,
        'body': json.dumps(bodyResponse)
    }
    

