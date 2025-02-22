import json

def lambda_handler(event, context):
    print("Pre-authentication trigger event:", event)

    email = event["request"]["userAttributes"].get("email", "")
    
    if not email.endswith("@rit.edu"):
        raise Exception("Only users with @rit.edu email addresses are allowed!")

    return event
