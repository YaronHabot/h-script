_ = require 'lodash'
map = require 'util/map'
{h2e} = require('util/translation-matrix')

program = require 'commander'
    .version((require 'package.json').version)
    .option '-c, --compile', 'Compile to Javascript and save as .js'
    .option '-o, --output', 'Set the output'
    .parse process.argv

config =
    source: program.compile
    out: program.compile || program.output

map config, (content) -> h2e content
