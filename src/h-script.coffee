_ = require 'lodash'
map = require './utils/map'
{h2e} = require './utils/translation-matrix'

program = require 'commander'
    .version((require '../package.json').version)
    .option '-c, --compile', 'Compile to Javascript and save as .js'
    .option '-o, --output', 'Set the output'
    .parse process.argv

config =
    source: program.compile
    out: program.compile || program.output

if program.compile == undefined
    do program.outputHelp
    return

map config, (content) -> h2e content
