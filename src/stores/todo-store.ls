require! {
  '../alt'
  'object-assign': merge
  '../actions/todo-actions'
}

class todo-store
  ->
    @bindActions(todo-actions)
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
    for id in @todos
      @update(id, updates)

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
    text = text ? text.trim() : ''
    return false if text is ''
    @update(id, {text})

  on-toggle-complete: (id) ->
    complete = !@todos[id].complete
    @update(id, { complete })

  on-toggle-complete-all: ->
    complete = !@@are-all-complete {@todos}
    @update-all { complete }

  on-destroy: (id) ->
    delete @todos[id]

  on-destroy-completed: ->
    for id in @todos
      @on-destroy id if @todos[id].complete

  @are-all-complete = (state) ->
    { todos } = state or @get-state!
    console.log todos
    for id in todos
      return false if !todos[id].complete
    return true

module.exports = alt.create-store todo-store
