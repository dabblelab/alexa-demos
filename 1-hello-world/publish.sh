SKILL_NAME="1-hello-world"
CODE_DIR="src"
NOW=$(date +%s)
ZIP_FILE="$SKILL_NAME-$NOW.zip"

if [ ! -f ./$ZIP_FILE ]; then
  echo "$ZIP_FILE not found. Creating file..."
  chmod -R +rw $CODE_DIR
  cd $CODE_DIR
  zip -r  "../$ZIP_FILE" * -x "*.DS_Store"
  echo "$ZIP_FILE created."
  cd ..
  aws lambda update-function-code --function-name $SKILL_NAME --zip-file fileb://$ZIP_FILE > ./deployments/$SKILL_NAME-$NOW.json
  if [ ! -f ./deployments ]; then
    mkdir deployments
  fi
  mv $ZIP_FILE ./deployments/
fi
