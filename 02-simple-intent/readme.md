# Hello World Skill

This is a bare bones template for a Node.js 'Hello World' skill. It only handles the 'LaunchRequest' so all this skill does is say 'Hello World' when it is opened.

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
  'Unhandled': function (){
    this.emit(':tell', 'Sorry, I dont understand.');
  }
};
```