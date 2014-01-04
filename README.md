#coffee-log#

A small script for logging all the coffee I taste.

At the moment each coffee is saved in a .json-file. In the future I might add a database of some sort to run stats.

##Dependencies##

Prompt [GitHub](https://github.com/flatiron/prompt)
CoffeeScript [GitHub](https://github.com/jashkenas/coffee-script)
jasmine-node-karma [GitHub](https://github.com/HuzuTech/jasmine-node-karma)

##Setup##

Clone the repo.

```
$ git clone git@github.com:zrrrzzt/coffee-log.git
```

cd into the directory

```
$ cd coffee-log
```

Get dependencies

```
$ npm install
```

Compile the .coffee files

```
$ coffee -c *.coffee
```

##Usage##

Run from the terminal

```
$ node index.js
```

The script will create a folder called "coffees" at first run.
This is where the .json-files will be saved.




