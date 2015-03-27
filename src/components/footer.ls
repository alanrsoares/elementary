require! {
  react
  '../util/elementary': $
  '../actions/todo-actions'
}

map    = (fn, xs) --> xs.map fn
filter = (fn, xs) --> xs.filter fn
length = (xs)     --> xs.length

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
                |> map (key) -> all-todos[key]
                |> filter (todo) -> todo.complete
                |> length

    items-left = total - completed

    items-left-plural = match items-left
                          | (> 1) => 'items'
                          | _     => 'item'
    items-left-phrase = "#items-left #items-left-plural left"

    clear-completed-button =
      $.button({
        class-name: 'clear-completed'
        on-click: @_on-clear-completed-click
      }, 'Clear completed') if completed

    $.footer class-name: 'footer',
      $.span class-name: 'todo-count',
        $.strong {} items-left-phrase
      clear-completed-button

  _on-clear-completed-click: ->
    todo-actions.destroy-completed!
