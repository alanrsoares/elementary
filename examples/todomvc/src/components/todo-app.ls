require! {
  react
  elementary: $
  './footer'
  './header'
  './main-section'
  'stores/todos': todos-store
  'alt/mixins/FluxyMixin'
}

get-todo-state = ->
  all-todos: todos-store.get-state!.todos
  are-all-complete: todos-store.are-all-complete!

module.exports = $.component do
  mixins: [FluxyMixin]

  statics:
    store-listeners:
      on-change: todos-store

  get-initial-state: ->
    get-todo-state!

  render: ->
    $.section class-name: 'todoapp',
      $(header, title: 'Eλementary')
      $(main-section,
        all-todos: @state.all-todos
        are-all-complete: @state.are-all-complete)
      $(footer,
        all-todos: @state.all-todos)

  on-change: ->
    @set-state get-todo-state
