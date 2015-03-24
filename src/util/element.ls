React = require 'react'
module.exports =
  (element, content) -->
    slice = [].slice.call arguments, 1
    args = [element] ++ slice
    React.createElement.apply this, args
