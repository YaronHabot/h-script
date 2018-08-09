#!/usr/bin/env node

_ = require 'lodash'
map = require './utils/map'
{h2e} = require './utils/translation-matrix'

program = require 'commander'
    .version((require '../package.json').version)
    .option '-c, --compile [path]', 'Compile to Javascript and save as .js'
    .option '-o, --output [path]', 'Set the output'
    .parse process.argv

config =
    source: program.compile
    out: program.compile || program.output

console.log config

if program.compile == undefined
    do program.outputHelp
    return

map config, (content) -> h2e content
