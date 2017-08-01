# Adding a Simple Intent

This demos shows how to add a simple intent to a custom skill. The code in this demo is a minor update to the code in the [01-hello-world](/01-hello-world) demo. To do this demo, complete the following steps:

1. Login to the [Developer Console](http://developer.amazon.com/alexa) 
2. Add an intent named 'HelloIntent' to the hello world skill
3. Add sample utternaces for the HelloIntent
4. Add handler code for the HelloIntent
5. Deploy Lambda 
6. Test the HelloIntent

### index.js
```javascript
// index.js

var Alexa = require('alexa-sdk');

exports.handler = function(event, context, callback){
  var alexa = Alexa.handler(event, context);
  alexa.registerHandlers(handlers);
  alexa.execute();
};

var handlers = {

  'LaunchRequest': function () {
    this.emit(':ask', 'Hello World!', 'I would ask a question if this skill was completed.');
  },
  'HelloIntent': function() {
    this.emit(':tell', 'Hello! Nice to meet you.');
  },
  'Unhandled': function (){
    this.emit(':tell', 'Sorry, I dont understand.');
  }
};
```