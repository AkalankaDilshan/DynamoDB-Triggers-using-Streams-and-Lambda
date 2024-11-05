import json
import boto3

def lambda_handler(event, context):
    sns = boto3.client('sns')
    account_id = context.invoked_function_arn.split(":")[4]
    region = context.invoked_function_arn.split(":")[3]
    
    sns_topic_name = 'User_table_sns'

    for record in event['Records']:
        new_image = record['dynamodb']['NewImage']
        user_id = new_image['userId']['S']
        
        # Publish the message to SNS
        response = sns.publish(
            TopicArn=f'arn:aws:sns:{region}:{account_id}:{sns_topic_name}',
            Message=f'{user_id} has been changed',
            Subject='Database Changes'
        )
    
    # Define the message for the response
    message = f'{user_id} has been changed'
    
    return {
        "statusCode": 200,
        "body": json.dumps({"message": message, "sns_response": response})
    }
