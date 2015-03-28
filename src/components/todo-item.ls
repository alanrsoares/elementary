require! {
  react
  'react/lib/cx'
  '../util/elementary' : $
  '../actions/todo-actions'
  './todo-text-input'
}

types = react.PropTypes

module.exports = react.create-class do
  prop-types:
    todo: types.object.is-required

  get-initial-state: ->
    is-editing: false

  render: ->
    todo = @props.todo

    input = $(todo-text-input do
              class-name: 'edit'
              onSave: @_onSave
              value: todo.text) if @state.is-editing

    $.li do
      key: todo.id
      class-name: cx({completed: todo.complete, editing: @state.is-editing}),
      $.div class-name:'view',
        $.input do
          class-name: 'toggle'
          type: 'checkbox'
          checked: todo.complete
          on-change: @_on-toggle-complete
        $.label on-double-click: @_on-double-click,
          todo.text
        $.button class-name: 'destroy' on-click: @_on-destroy-click
      input

  _on-toggle-complete: ->
    todo-actions.toggle-complete @props.todo.id

  _on-double-click: ->
    @set-state is-editing: true

  _on-save: (text) ->
    todo-actions.update-text { id: @props.todo.id, text }
    @set-state is-editing: false

  _on-destroy-click: ->
    todo-actions.destroy @props.todo.id
