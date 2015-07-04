require! {
  react
  '../../lib/elementary' : $
}

ENTER_KEY_CODE = 13

module.exports = $.component do

  get-initial-state: ->
    value: @props.value or ''

  render: ->
    $.input do
      class-name: @props.class-name
      id: @props.id
      placeholder: @props.placeholder
      on-blur: @on-blur
      on-change: @on-change
      on-key-down: @on-key-down
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
  on-change: (event) ->
    @set-state value: event.target.value

  /**
   * @param  {object} event
   */
  on-key-down: (event) ->
    @save! if event.keyCode is ENTER_KEY_CODE
