_ = require 'lodash'

program = require 'commander'
    .version((require 'package.json').version)
    .option '-c, --compile', 'Compile to Javascript and save as .js'
    .option '-o, --output', 'Set the output'
    .parse process.argv
