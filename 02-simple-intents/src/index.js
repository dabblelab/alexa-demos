var Alexa = require('alexa-sdk');

exports.handler = function(event, context, callback){
  var alexa = Alexa.handler(event, context);
  alexa.registerHandlers(handlers);
  alexa.execute();
};

var handlers = {

  'LaunchRequest': function () {
    this.emit(':ask', 'Can you say hello?', 'Say hello to test the Hello Intent.');
  },
  'HelloIntent': function() {
    this.emit(':tell', 'Hello! Nice to meet you.');
  },
  'Unhandled': function (){
    this.emit(':tell', 'Sorry, I dont understand.');
  }
};