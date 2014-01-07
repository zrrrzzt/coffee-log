fs = require("fs")
# process = require("process")
prompt = require("prompt")
schema = require("./coffee.schema")
coffeeLog = require("./coffee.log")
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

listCoffees = (directory) ->
  coffeeLog.listCoffees(directory, (err, files) ->
    if err
      console.log err
    else
      console.log(file) for file in files
  )

whatToDo = (args) ->
  if "add" in args
    checkDirectory saveFolder
  else if "list" in args
    listCoffees saveFolder
  else
    msg = "Please make you choice. Call with 'add' or 'list'"
    console.log(msg)

whatToDo(process.argv)