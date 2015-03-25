require! react

module.exports = (element) -->
  slice = [].slice.call arguments, 1
  slice[0] = {} if typeof slice[0] is 'undefined'
  react.createElement.apply this, [element] ++ slice
