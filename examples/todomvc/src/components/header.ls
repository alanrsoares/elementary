require! {
  react: { Component, PropTypes: types }
  elementary: $
  '../actions/todo-actions'
  './todo-text-input'
}

{ header, h1 } = $

module.exports = class Header extends Component
  render: ->
    header class-name:'header',
      h1 {} @props.title
      $ todo-text-input, do
        class-name: 'new-todo'
        placeholder: 'What needs to be done?'
        on-save: @handle-save

  handle-save: (text) ->
    todo-actions.create text
