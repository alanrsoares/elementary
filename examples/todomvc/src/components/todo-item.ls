require! {
  react
  classnames: cx
  elementary: $
  '../actions/todo-actions'
  './todo-text-input'
}

{ li, div, input, label, button } = $

types = react.PropTypes

module.exports = react.create-class do
  prop-types:
    todo: types.object.is-required

  get-initial-state: ->
    is-editing: false

  render: ->
    todo = @props.todo
    li-classes = cx do
                  completed: todo.complete
                  editing: @state.is-editing
    li do
      key: todo.id
      class-name: li-classes,
      div class-name: 'view',
        @render-checkbox todo
        label on-double-click: @handle-double-click,
          todo.text
        @render-destroy-button!
      @render-text-input todo

  render-checkbox: (todo) ->
    input do
      class-name: 'toggle'
      type: 'checkbox'
      checked: todo.complete
      on-change: @handle-checkbox-toggle

  render-destroy-button: ->
    button do
      class-name: 'destroy'
      on-click: @handle-destroy-click

  render-text-input: (todo) ->
    return if not @state.is-editing
    $ todo-text-input,
      class-name: 'edit'
      on-save: @handle-save
      value: todo.text

  handle-checkbox-toggle: ->
    todo-actions.toggle-complete @props.todo.id

  handle-double-click: ->
    @set-state is-editing: true

  handle-save: (text) ->
    todo-actions.update-text { id: @props.todo.id, text }
    @set-state is-editing: false

  handle-destroy-click: ->
    todo-actions.destroy @props.todo.id
