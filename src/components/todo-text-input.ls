require! {
  react
  '../util/elementary' : $
}

ENTER_KEY_CODE = 13

module.exports = react.createClass do

  get-initial-state: ->
    value: @props.value or ''

  render: ->
    $.input {
      class-name: @props.class-name
      id: @props.id
      placeholder: @props.placeholder
      on-blur: @_on-blur
      on-change: @_on-change
      on-key-down: @_on-key-down
      value: @state.value
      autoFocus: true
    }

  /**
   * Invokes the callback passed in as onSave, allowing this component to be
   * used in different ways.
   */
  _save: ->
    @props.on-save @state.value
    @setState value: ''

  /**
   * @param {object} event
   */
  _on-change: (event) ->
    @setState value: event.target.value

  /**
   * @param  {object} event
   */
  _on-key-down: (event) ->
    @_save! if (event.keyCode is ENTER_KEY_CODE)
