require! '../alt'

class todo-actions
  ->
    @generate-actions 'create',
                      'updateText',
                      'toggleComplete',
                      'toggleCompleteAll'
                      'destroy'
                      'destroyCompleted'

module.exports = alt.create-actions todo-actions
