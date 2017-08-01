FUNCTION_NAME="alexa-demo"
RGEION=us-east-1
RUNTIME=nodejs6.10 
ROLE=arn:aws:iam::851751148026:role/lambda_basic_execution #this role must exist

aws --region $RGEION lambda create-function \
--function-name $FUNCTION_NAME \
--runtime $RUNTIME \
--role $ROLE \
--handler "index.handler" \
--zip-file fileb://hello-world.zip \
--description "" \
--timeout 30

aws --region $RGEION lambda add-permission \
--function-name $FUNCTION_NAME \
--statement-id "1234" \
--action "lambda:InvokeFunction" \
--principal "alexa-appkit.amazon.com"