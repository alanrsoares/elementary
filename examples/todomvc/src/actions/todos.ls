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
  alt.create-actions class todos-actions
    ->
      @generate-actions.apply @, actions
