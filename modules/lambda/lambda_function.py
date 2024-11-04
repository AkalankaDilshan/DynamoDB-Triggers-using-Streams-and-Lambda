import json

def lambda_handler(event, context):
    for record in event['Records']:
        # Process the event type: INSERT, MODIFY, REMOVE
        event_name = record['eventName']
        if event_name == 'INSERT':
            # Handle new item inserted
            new_image = record['dynamodb']['NewImage']
            print("New item added:", json.dumps(new_image))
        elif event_name == 'MODIFY':
            # Handle item modified
            old_image = record['dynamodb']['OldImage']
            new_image = record['dynamodb']['NewImage']
            print("Item modified from", json.dumps(old_image), "to", json.dumps(new_image))
        elif event_name == 'REMOVE':
            # Handle item removed
            old_image = record['dynamodb']['OldImage']
            print("Item removed:", json.dumps(old_image))
    return {'statusCode': 200}
