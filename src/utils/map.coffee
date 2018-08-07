fs = require 'fs'
{readFiles} = require 'node-dir'

module.exports = (config, handler) ->
    return new Promise (resolve) -> {
        readFiles config.source, (err, content, next) ->
                if !err then handler content
                next
            , resolve
    }
