/**
 * Created by geir on 02/01/14.
 */

var
  fs = require('fs'),
  prompt = require('prompt'),
  schema = require('./coffee.schema'),
  saveFolder = 'coffees';

function saveCoffee(coffee){
  var
    filename = coffee.id + '.json';

  fs.writeFile(saveFolder + '/' + filename, JSON.stringify(coffee), function(err){
    if(err) {
      console.log(err);
    } else {
      console.log('file saved')
    }
  });
}

function newCoffee(){
  var
    coffee = {},
    date = new Date();

  coffee.id = date.getTime();
  coffee.date = date;

  prompt.addProperties(coffee, schema, function(err, result){
    if(err) {
      console.log(err);
    } else {
      saveCoffee(coffee);
    }
  })
}

function createDirectory(directoryPath) {
  fs.mkdir(directoryPath, function(err){
    if(err) {
      console.log(err);
      cosole.log("I'm so lost right now.");
    } else {
      console.log("Directory added. Doing another check.");
      checkDirectory(directoryPath);
    }
  });
}

function checkDirectory(directory) {
  fs.stat(directory, function(err, stats){
    if (err) {
      console.log(err);
      console.log("Directory missing. Will try to create it.");
      createDirectory(directory);
    } else {
      console.log("Directory exists. Let's add some coffee");
      newCoffee();
    }
  });
}

checkDirectory(saveFolder);