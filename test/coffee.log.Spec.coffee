CoffeeLog = require('../coffee.log.js')

describe 'CoffeeLog', ->

  it 'Should return a list of coffees, given a folderpath', (done) ->
    folderPath = 'test/testdata'
    CoffeeLog.listCoffees(folderPath, (err, files) ->
      if err
        err
      else
        expect(files.length).toBe(7)
        done()
      )

  it 'Should return the amount of coffees, given a folderpath', (done) ->
    folderPath = 'test/testdata'
    CoffeeLog.countCoffees(folderPath, (err, amount) ->
      if err
        err
      else
        expect(amount.length).toBe(7)
        done()
    )

  it 'Should return a coffee, given a path', (done) ->
    path = 'test/testdata/1388692399222.json'
    CoffeeLog.getCoffee(path, (err, data) ->
      if err
        err
      else
        coffee = JSON.parse(data)
        expect(coffee.name).toBe('Siberia Estate');
        done()
    )

