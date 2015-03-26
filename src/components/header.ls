require! {
  react: {Component, PropTypes:types}
  '../util/elementary' : $
  '../actions/todo-actions'
  './todo-text-input'
}

module.exports = class Header extends Component
  render: ->
    $.header id:'header',
      $.h1 {} 'Eλementary Todo'
      $(todo-text-input, do
        id: 'new-todo'
        placeholder: 'What needs to be done?'
        on-save: @_onSave)

  _on-save: (text) ->
    todo-actions.create text
