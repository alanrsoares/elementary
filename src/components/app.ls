React = require 'react'
Hello = require './hello.ls'

App = React.createClass do
  render: ->
    ``<Hello name="Jucanildo" />``

module.exports = App
