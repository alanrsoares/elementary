require! {
  react
  '../util/elementary': $
  './footer'
  './header'
  './main-section'
  '../stores/todo-store'
  'alt/mixins/FluxyMixin': fluxy
}

get-todo-state = ->
  all-todos: todo-store.get-state!.todos
  are-all-complete: todo-store.are-all-complete!

module.exports = react.create-class do
  mixins: [fluxy]

  statics:
    store-listeners:
      _on-change: todo-store

  get-initial-state: ->
    get-todo-state!

  render: ->
    $.div {},
      $(header)
      $(main-section, {
        all-todos: @state.all-todos
        are-all-complete: @state.are-all-complete
      })
      $(footer, all-todos: @state.all-todos)

  _on-change: ->
    @set-state get-todo-state
