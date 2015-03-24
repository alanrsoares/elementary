React = require 'react'
Hello = require './hello'
$ = require '../util/element'

module.exports = class App extends React.Component
  render: -> $ Hello, { name:'LiveScript' }
