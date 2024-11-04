import json
import boto3

def lambda_handler(event, context):
    sns = boto3.client('sns')
    account_id = context.invoked_function_arn.split(":")[4]
    region = context.invoked_function_arn.split(":")[3]
    
    # Set the SNS topic name (replace 'TableChangeAlerts' with your actual SNS topic name)
    sns_topic_name = 'TableChangeAlerts'

    for record in event['Records']:
        # Process the event type: INSERT, MODIFY, REMOVE
        event_name = record['eventName']
        if event_name == 'INSERT':
            # Handle new item inserted
            new_image = record['dynamodb']['NewImage']
            message = 'New item added'
        elif event_name == 'MODIFY':
            # Handle item modified
            old_image = record['dynamodb']['OldImage']
            new_image = record['dynamodb']['NewImage']
            message = 'Item modified'
        elif event_name == 'REMOVE':
            # Handle item removed
            old_image = record['dynamodb']['OldImage']
            message = "Item removed"
        
        # Publish the message to SNS
        response = sns.publish(
            TopicArn=f'arn:aws:sns:{region}:{account_id}:{sns_topic_name}',
            Message=message,
            Subject='Database Changes'
        )
    
    return {
        "statusCode": 200,
        "body": json.dumps({"message": message, "sns_response": response})
    }
