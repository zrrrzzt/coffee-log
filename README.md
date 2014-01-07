#coffee-log#

A small script for logging all the coffee I taste.

At the moment each coffee is saved in a .json-file. In the future I might add a database of some sort to run stats.

##Dependencies##

Prompt [GitHub](https://github.com/flatiron/prompt)

CoffeeScript [GitHub](https://github.com/jashkenas/coffee-script)

```
$ npm install -g coffee-script
```

jasmine-node [GitHub](https://github.com/mhevery/jasmine-node)

```
$ npm install -g jasmine-node
```


##Setup##

Clone the repo.

```
$ git clone git@github.com:zrrrzzt/coffee-log.git
```

cd into the directory

```
$ cd coffee-log
```

Get local dependencies

```
$ npm install
```

Compile the .coffee files

```
$ coffee -c *.coffee
```

##Usage##

Run from the terminal.

To add a new coffee

```
$ node index.js add
```

The script will create a folder called "coffees" at first run.
This is where the .json-files will be saved.

To list all coffees

```
$ node index.js list
``

##Test##

Run from the terminal

````
$ jasmine-node --coffee test
```




