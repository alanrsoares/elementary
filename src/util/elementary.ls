require! {
  react
  './html-elements'
}

slice = (args, index) -> [].slice.call args, index or 0

builder = (tag) -->
  args = slice arguments, 1
  args[0] = {} if typeof args[0] is 'undefined'
  react.createElement.apply this, [tag] ++ args

reducer = (reduced, tag) ->
  reduced[tag] = -->
    args = slice arguments
    builder.apply this, [tag] ++ args
  reduced

elementary = html-elements .reduce reducer, builder

module.exports = elementary
