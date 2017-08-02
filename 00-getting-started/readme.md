# Getting Started

There are bash scripts (.sh) that are included with the sample code. These are mostly wrappers for the [AWS Command Line Interface](http://aws.amazon.com/cli) (aws-cli) that are used to simplify the process of creating and deploying Lambda functions. 

To use these scripts, you'll need to install and configure the aws-cli and you'll need a computer with Bash on it. Bash is available by default on Mac and Linux but not on Windows. A quick Google search shows that you can install bash on Windows. That should allows these scripts to work on Windows but that has not been tested.

## Creating a Lambda function for an Alexa Skill using the AWS CLI

The following bash script (bash.sh) is used to create a nodejs Lambda function with the name 'alexa-demo' in the us-east-1 region and sets the Alexa Skills Kit as a trigger. It uses the hello-world.zip file as a template. The template is a bare bones custom Alexa skill. 

```bash
# create.sh
# Creates a nodejs Lambda function with the name 'alexa-demo' in the us-east-1 region and sets the Alexa Skills Kit as a trigger.

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
```

NOTE: You may need to setup execute permission to run this script. To do so run the following from the same directory that the script is in.

```bash
$ chmod +x create.sh
```