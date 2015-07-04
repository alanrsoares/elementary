require! {
  '../alt'
  'object-assign': merge
  '../actions/todo-actions'
}

class todo-store
  ->
    @bindActions todo-actions
    @todos =
      'id1':
        id: 'id1'
        complete: false
        text: 'Configure Jest'
      'id2':
        id: 'id2'
        complete: false
        text: 'Add unit tests'
      'id3':
        id: 'id3'
        complete: false
        text: 'Achieve 100% code coverage'

  update: (id, updates) ->
    if @todos[id] and updates then
      @todos[id] = merge(@todos[id], updates)

  update-all: (updates) ->
    self = @
    Object.keys self.todos
      |> ( .map (id) -> self.update(id, updates) )

  on-create: (text) ->
    text = text.trim()
    return false if text is ''

    # hand waving of course.
    id = (+new Date! + Math.floor(Math.random! * 999999)).to-string 36
    @todos[id] = do
      id: id
      complete: false
      text: text

  on-update-text: (x) ->
    { id, text } = x
    text = if text then text.trim() else ''
    return false if text is ''
    @update(id, { text })

  on-toggle-complete: (id) ->
    complete = !@todos[id].complete
    @update(id, { complete })

  on-toggle-complete-all: ->
    complete = !@@are-all-complete { todos: @todos }
    @update-all { complete }

  on-destroy: (id) ->
    delete @todos[id]

  on-destroy-completed: ->
    self = @
    Object.keys self.todos
      .filter (id) -> self.todos[id].complete
      .map (id) -> self.on-destroy id

  @are-all-complete = (state) ->
    { todos } = state or @get-state!

    Object.keys todos
      .map (key) -> todos[key]
      .filter (todo) -> not todo.complete
      .length is 0

module.exports = alt.create-store todo-store
