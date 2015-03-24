React = require 'react'
$ = require '../util/element'

module.exports = React.createClass do
  prop-types:
    name: React.PropTypes.string
    
  list-item: (n) ->
    $ 'li' { className:'item' },
      $ 'a' {href:"#/dummy/#n"} "dummy link #n"

  render: ->
    $ 'div' { className: 'hello-container'},
      $ 'h1' {} "Hello, #{@props.name}!"
      $ 'ul' {},
        [ 1 to 15 ] .map @list-item
