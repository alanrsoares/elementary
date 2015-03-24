React = require 'react'

$ = (element, content) -->
  console.log typeof content
  slice = [].slice.call arguments, 1
  args = [element] ++ slice
  React.createElement.apply this, args

module.exports = React.createClass do
  prop-types:
    name: React.PropTypes.string
  list-item: (n) ->
    $ 'li' { className:'item' } n

  render: ->
    $ 'div' { className: 'hello-container'},
      $ 'h1' {} "Hello, #{@props.name}!"
      $ 'ul' {},
        [ 1 to 5 ] .map @list-item
      $ 'p' {},
        $ 'a' { href:'/#/dummy' } 'A dummy link'
        $ 'div' {},
          ``<a href='/#/que-porra'>baralho</a>``
        $ 'nav' null 'foo'
