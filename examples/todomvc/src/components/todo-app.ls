require! {
  react
  elementary: $
  './footer'
  './header'
  './main-section'
  '../stores/todo-store'
  'alt/mixins/FluxyMixin'
}

{ div } = $

get-todo-state = ->
  all-todos: todo-store.get-state!.todos
  are-all-complete: todo-store.are-all-complete!

module.exports = react.create-class do
  mixins: [FluxyMixin]

  statics:
    store-listeners:
      on-store-change: todo-store

  get-initial-state: ->
    get-todo-state!

  render: ->
    { all-todos, are-all-complete } = @state
    div {},
      $ header, title: 'Eλementary'
      $ main-section, { all-todos, are-all-complete }
      $ footer, { all-todos }

  on-store-change: ->
    @set-state get-todo-state
