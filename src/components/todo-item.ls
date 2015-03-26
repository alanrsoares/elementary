require! {
  react
  'react/lib/cx'
  '../util/elementary' : $
  './todo-text-input'
}

types = react.PropTypes

module.exports = react.createClass do
  prop-types:
    todo: types.object.is-required

  get-initial-state: ->
    is-editing: false

  render: ->
    todo = @props.todo

    input = $(todo-text-input, {
              class-name: 'edit'
              onSave: @_onSave
              value: todo.text
            }) if @state.is-editing

    $.li key: todo.id
         class-name: cx {completed: todo.complete editing: @state.is-editing},
      $.div class-name:'view',
        $.input {
          class-name: 'toggle'
          type: 'checkbox'
          checked: todo.complete
          on-change: @_on-toggle-complete
        }
        $.label on-double-click: @_on-double-click,
          todo.text
        $.button class-name: 'destroy' on-click: @_on-destroy-click
      input

    _on-toggle-complete: ->
      TodoActions.toggle-complete @props.todo

    _on-double-click: ->
      @set-state is-editing: true

    _on-save: ->
      TodoActions.update-text @props.todo.id, text

    _on-_on-destroy-click: ->
      TodoActions.destroy @props.todo.id
