require! {
  react
  '../util/elementary': $
  '../actions/todo-actions'
}

types = react.PropTypes

module.exports = react.createClass do
  prop-types:
    all-todos: types.object.is-required

  /**
   * @return {object}
   */
  render: ->
    all-todos = @props.all-todos
    total = Object.keys(all-todos).length

    return null if total is 0

    completed = Object.keys(all-todos)
                |> (.map (key) -> all-todos[key])
                |> (.filter (todo) -> todo.complete)
                |> (.length)

    items-left = total - completed

    items-left-plural = match items-left
                          | (> 1) => 'items'
                          | _     => 'item'
    items-left-phrase = "#items-left-plural left"

    clear-completed-button =
      $.button({
        id: 'clear-completed'
        on-click: @_on-clear-completed
      }, 'Clear completer') if completed

    $.footer id: 'footer',
      $.span id: 'todo-count',
        $.strong {} items-left
      clear-completed-button

  _on-clear-completed-click: ->
    todo-actions.destroy-completed!
