require! {
  react
  'react/lib/cx'
  '../../lib/elementary' : $
  '../actions/todo-actions'
  './todo-text-input'
}

types = react.PropTypes

module.exports = $.component do
  prop-types:
    todo: types.object.is-required

  get-initial-state: ->
    is-editing: false

  render: ->
    todo = @props.todo

    input = $(todo-text-input,
              class-name: 'edit'
              on-save: @on-save
              value: todo.text) if @state.is-editing

    $.li do
      key: todo.id
      class-name: cx(completed: todo.complete, editing: @state.is-editing),
      $.div class-name:'view',
        $.input do
          class-name: 'toggle'
          type: 'checkbox'
          checked: todo.complete
          on-change: @on-toggle-complete
        $.label on-double-click: @on-double-click,
          todo.text
        $.button class-name: 'destroy' on-click: @on-destroy-click
      input

  on-toggle-complete: ->
    todo-actions.toggle-complete @props.todo.id

  on-double-click: ->
    @set-state is-editing: true

  on-save: (text) ->
    todo-actions.update-text id: @props.todo.id, text
    @set-state is-editing: false

  on-destroy-click: ->
    todo-actions.destroy @props.todo.id
