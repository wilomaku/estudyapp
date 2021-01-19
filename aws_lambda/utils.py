import os
import pandas as pd

def downloadS3File(bucket_name, filename):
    import boto3
    
    #bucket_name = os.environ.get('BUCKET_NAME')
    #filename = os.environ.get('PKL_PREFIX')+os.environ.get('PKL_VERSION')+'.pkl'
    target_filename='/tmp/'+filename.split('/')[-1]
    
    s3 = boto3.client('s3')
    s3.download_file(bucket_name, filename, target_filename)
    return target_filename

ACCENTS = {
    'Ñ':'-&N-',
    'ñ':'-&n-',
    'Á':'-&A-',
    'á':'-&á-',
    'É':'-&E-',
    'é':'-&e-',
    'Í':'-&I-',
    'í':'-&i-',
    'Ó':'-&O-',
    'ó':'-&o-',
    'Ú':'-&U-',
    'ú':'-&u-',
}

def replaceAccents(content, decode=False):
    for key, value in ACCENTS.items():
        if decode:
            content = content.replace(value, key)
        else:
            content = content.replace(key, value)
            
def getMax(target):
    target['normalized_value'] = target['value'].max()
    return target
 