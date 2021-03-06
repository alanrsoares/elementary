require! {
  react: { PropTypes: types }
  elementary: $
  './todo-item'
  '../actions/todo-actions'
}

{ section, input, label, ul } = $

module.exports = $.component do
  prop-types:
    all-todos: types.object.is-required
    are-all-complete: types.bool.is-required

  render: ->
    all-todos = @props.all-todos
    keys = Object.keys all-todos

    return null if not keys.length

    section class-name: 'main',
      input do
        class-name: 'toggle-all'
        type: 'checkbox'
        on-change: @handle-input-change
        checked: 'checked' if @props.are-all-complete
      label html-for: 'toggle-all',
        'Mark all as complete'
      ul class-name: 'todo-list',
        keys.map (key) ->
          todo = all-todos[key]
          $ todo-item, { key, todo }

  handle-input-change: ->
    todo-actions.toggle-complete-all!
