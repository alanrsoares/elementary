require! {
  react: {Component, PropTypes:types}
  '../util/elementary' : $
  './todo-text-input'
}

module.exports = class Header extends Component
  render: ->
    $.header {id:'header'},
      $.h1 {} 'todos'
      $(todo-text-input, {
        id: 'new-todo'
        placeholder: 'What needs to be done?'
        onSave: @_onSave
      })

  _onSave: (text) ->
    console.log 'Saving: ' + text
