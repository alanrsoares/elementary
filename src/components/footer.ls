require! {
  react
  '../../lib/elementary': $
  '../actions/todo-actions'
}

types = react.PropTypes

{ button, span, footer, strong } = $

module.exports = $.component do
  prop-types:
    all-todos: types.object.is-required

  render: ->
    all-todos = @props.all-todos
    total = Object.keys(all-todos).length

    return null if total is 0

    completed = Object.keys all-todos
                  .map (key) -> all-todos[key]
                  .filter (todo) -> todo.complete
                  .length

    items-left = total - completed
    items-left-plural = if items-left > 1 then 'items' else 'item'
    items-left-phrase = "#items-left #items-left-plural left"

    clear-completed-button =
      button({
        class-name: 'clear-completed'
        on-click: @_on-clear-completed-click
      }, 'Clear completed') if completed

    footer class-name: 'footer',
      span class-name: 'todo-count',
        strong items-left-phrase
      clear-completed-button

  _on-clear-completed-click: ->
    todo-actions.destroy-completed!
