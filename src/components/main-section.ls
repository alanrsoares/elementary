require! {
  react
  '../../lib/elementary':$
  './todo-item'
  '../actions/todo-actions'
}

types = react.PropTypes

module.exports = $.component do
  prop-types:
    all-todos: types.object.is-required
    are-all-complete: types.bool.is-required

  render: ->
    all-todos = @props.all-todos
    keys = Object.keys all-todos

    return null if not keys.length

    todos = keys.map (key) ->
              $(todo-item, do
                key: key
                todo: all-todos[key])

    $.section class-name: 'main',
      $.input do
        class-name: 'toggle-all'
        type: 'checkbox'
        on-change: @_on-toggle-complete-all
        checked: 'checked' if @props.are-all-complete
      $.label html-for: 'toggle-all',
        'Mark all as complete'
      $.ul class-name: 'todo-list',
        todos

  _on-toggle-complete-all: ->
    todo-actions.toggle-complete-all!
