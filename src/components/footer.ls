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

  render-clear-completed-button: (completed) ->
    if completed then button do
      class-name: 'clear-completed'
      on-click: @_on-clear-completed-click,
        'Clear completed'

  render: ->
    all-todos = @props.all-todos
    total = Object.keys(all-todos).length

    return null if total is 0

    completed = Object.keys all-todos
                  .map (key) -> all-todos[key]
                  .filter (todo) -> todo.complete
                  .length

    items-left = total - completed
    items-left-plural = "item#{if items-left > 1 then 's' else ''}"
    items-left-phrase = "#{if items-left then items-left else 'no'} #items-left-plural left"

    footer class-name: 'footer',
      span class-name: 'todo-count',
        strong items-left-phrase
      @render-clear-completed-button

  _on-clear-completed-click: ->
    todo-actions.destroy-completed!
