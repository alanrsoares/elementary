React = require 'react'
Hello = require './hello'
$ = require '../util/element'

module.exports = React.createClass do
  render: -> $ Hello, { name:'LiveScript' }
