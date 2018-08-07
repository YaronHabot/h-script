fs = require 'fs'
path = require 'path'
recursive = require 'recursive-readdir'
_ = require 'lodash'

cullFirst = (p) ->
    t = _.split p, '\\'
    t = _.drop t
    return _.join t, '\\'

module.exports = (config, handler) ->
    recursive config.source, (err, files) ->
        if err
            console.error err
            return
        _.map files, (file) ->
            console.log "Processing #{file}"
            fs.readFile file, (err, data) ->
                fs.writeFile (path.join config.out, cullFirst file), handler(data), () -> console.log "Done with #{file}"
