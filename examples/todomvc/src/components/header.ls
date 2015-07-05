require! {
  react: { Component, PropTypes: types }
  elementary: $
  '../actions/todo-actions'
  './todo-text-input'
}

module.exports = class Header extends Component
  render: ->
    $.header class-name:'header',
      $.h1 {} @props.title
      $(todo-text-input, do
        class-name: 'new-todo'
        placeholder: 'What needs to be done?'
        on-save: @_on-save)

  _on-save: (text) ->
    todo-actions.create text