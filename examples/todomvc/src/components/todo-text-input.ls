require! {
  react
  elementary: $
}
{ input } = $

ENTER_KEY_CODE = 13

module.exports = react.create-class do
  get-initial-state: ->
    value: @props.value or ''

  render: ->
    input do
      class-name: @props.class-name
      id: @props.id
      placeholder: @props.placeholder
      on-blur: @handle-blur
      on-change: @handle-change
      on-key-down: @handle-key-down
      value: @state.value
      auto-focus: true

  /**
   * Invokes the callback passed in as onSave, allowing this component to be
   * used in different ways.
   */
  save: ->
    @props.on-save @state.value
    @set-state value: ''

  /**
   * @param {object} event
   */
  handle-blur: (event) ->
    @handle-change event
    @save!

  /**
   * @param {object} event
   */
  handle-change: (event) ->
    @set-state value: event.target.value

  /**
   * @param  {object} event
   */
  handle-key-down: (event) ->
    @save! if event.keyCode is ENTER_KEY_CODE
