require! '../alt'

actions = <[
    create
    updateText
    toggleComplete
    toggleCompleteAll
    destroy
    destroyCompleted
  ]>

module.exports =
  alt.create-actions class todo-actions
    ->
      @generate-actions.apply @, actions
