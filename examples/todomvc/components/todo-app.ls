require! {
  react
  '../../lib/elementary': $
  './footer'
  './header'
  './main-section'
  '../stores/todo-store'
  'alt/mixins/FluxyMixin'
}

get-todo-state = ->
  all-todos: todo-store.get-state!.todos
  are-all-complete: todo-store.are-all-complete!

module.exports = $.component do
  mixins: [FluxyMixin]

  statics:
    store-listeners:
      on-change: todo-store

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
