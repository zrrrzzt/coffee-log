CoffeeLog = require('../coffee.log.js')

describe 'CoffeeLog', ->

  it 'Should return a list of coffees', ->
    result = CoffeeLog.getCoffees()
    expect(result.length).toBeGreaterThan(0)

  it 'Should return a coffee', ->
    coffee =
      'title' : 'Yummy coffee'
    result = CoffeeLog.printCoffee(coffee)
    expect(result.title).toBe('Yummy coffee')

