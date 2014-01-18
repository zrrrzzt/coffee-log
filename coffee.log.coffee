fs = require("fs")

module.exports =

  listCoffees: (folderPath, callback) ->
    fs.readdir(folderPath, callback)

  getCoffee: (path, callback) ->
    fs.readFile(path, callback)

  countCoffees: (folderPath, callback) ->
    fs.readdir(folderPath, callback)