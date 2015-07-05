require! 'alt-instance': alt

actions = <[
  create
  updateText
  toggleComplete
  toggleCompleteAll
  destroy
  destroyCompleted
]>

class todo-actions
  ->
    @generate-actions.apply @, actions

module.exports = alt.create-actions todo-actions
