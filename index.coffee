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


getCoffee = (path) ->
  coffeeLog.getCoffee(path, (err, data) ->
    if err
      console.log err
    else
      coffee = JSON.parse(data)
      console.log(coffee.name + ' - ' + coffee.roastery)
  )

listCoffees = (directory) ->
  coffeeLog.listCoffees(directory, (err, files) ->
    if err
      console.log err
    else
      getCoffee(directory + '/' + file) for file in files
  )

countCoffees = (directory) ->
  coffeeLog.countCoffees(directory, (err, files) ->
    if err
      console.log err
    else
      console.log files.length
  )

whatToDo = (args) ->
  if "add" in args
    checkDirectory saveFolder
  else if "list" in args
    listCoffees saveFolder
  else if "count" in args
    countCoffees saveFolder
  else
    msg = "Please make you choice. Call with 'add', 'list' or 'count'"
    console.log(msg)

whatToDo(process.argv)