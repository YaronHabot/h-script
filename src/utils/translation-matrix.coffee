_ = require 'lodash'
e2h = require '../../data/keywords.json'
h2e = _.invert e2h

t = (content, table) ->
    work = content
    for k, v of table
        work = _.replace work, k, v


module.exports =
    e2h: (content) ->
        return t content, e2h
    h2e: (input) ->
        return t content, h2e
