fs = require 'fs'
path = require 'path'
recursive = require 'recursive-readdir'

cullFirst = (p) ->
    t = _.split p, '\\'
    t = _.drop p
    return _.join p, '\\'

module.exports = (config, handler) ->
    recursive config.source, (err, files) ->
        _.map files, (file) ->
            fs.readFile file, (err, data) ->
                fs.writeFile (path.join config.out, cullFirst file), handler(data)
