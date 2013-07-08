{exec} = require 'child_process'
fs = require 'fs'

task 'compile','Compile shuron.js',(options)->
  exec "coffee -o public/js/ -c src/shuron.coffee",(err,stdout,stderr)->
    throw err if err
    console.log stdout + stderr

task 'clean', 'Delete shuron.js',(options)->
  exec "rm public/js/shuron.js",(err,stdout,stderr)->
    throw err if err
    console.log stdout + stderr

