require! {
  react: { PropTypes: types }
  elementary: $
  '../actions/todo-actions'
}

{ button, span, footer, strong } = $
{ keys } = Object

module.exports = $.component do
  prop-types:
    all-todos: types.object.is-required

  render: ->
    all-todos = @props.all-todos

    total = keys(all-todos).length

    return null if total is 0

    completed = keys all-todos
                  .map (key) -> all-todos[key]
                  .filter (.complete)
                  .length

    items-left = total - completed
    items-left-plural = if items-left > 1 then 'items' else 'item'
    items-left-phrase = "#items-left #items-left-plural left"

    footer class-name: 'footer',
      span class-name: 'todo-count',
        strong items-left-phrase
      @render-clear-completed-button completed

  render-clear-completed-button: (completed) ->
    if completed then
      button do
        class-name: 'clear-completed'
        on-click: @handle-clear-completed-click,
        'Clear completed'

  handle-clear-completed-click: ->
    todo-actions.destroy-completed!
