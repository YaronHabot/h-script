fs = require 'fs'
path = require 'path'
recursive = require 'recursive-readdir'
_ = require 'lodash'

cullFirst = (p) ->
    t = _.split p, '\\'
    t = _.drop t
    return _.join t, '\\'

ignore = (f) -> (path.extname f) isnt ".hjs"

wf = (r, f) ->
    t = path.join r, cullFirst f
    return _.replace t, '.hjs', '.js'

module.exports = (config, handler) ->
    recursive config.source, [ignore], (err, files) ->
        if err
            console.error err
            return
        _.map files, (file) ->
            console.log "Processing #{file}"
            fs.readFile file, (err, data) =>
                fs.writeFile (wf config.out, file), (handler data), () -> console.log "Done with #{file}"
