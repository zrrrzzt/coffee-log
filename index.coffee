fs = require("fs")
prompt = require("prompt")
schema = require("./coffee.schema")
saveFolder = "coffees"

saveCoffee = (coffee) ->
  filename = coffee.id + ".json"
  fs.writeFile saveFolder + "/" + filename, JSON.stringify(coffee), (err) ->
    if err
      console.log err
    else
      console.log "file saved"

newCoffee = ->
  coffee = {}
  date = new Date()
  coffee.id = date.getTime()
  coffee.date = date
  prompt.addProperties coffee, schema, (err, result) ->
    if err
      console.log err
    else
      saveCoffee coffee

createDirectory = (directoryPath) ->
  fs.mkdir directoryPath, (err) ->
    if err
      console.log err
      cosole.log "I'm so lost right now."
    else
      console.log "Directory added. Doing another check."
      checkDirectory directoryPath

checkDirectory = (directory) ->
  fs.stat directory, (err, stats) ->
    if err
      console.log err
      console.log "Directory missing. Will try to create it."
      createDirectory directory
    else
      console.log "Directory exists. Let's add some coffee"
      newCoffee()

checkDirectory saveFolder