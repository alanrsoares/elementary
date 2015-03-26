require! {
  react: {Component, PropTypes}
  '../util/elementary' : $
}

ENTER_KEY_CODE = 13

module.exports = class TodoTextInput extends Component



  render: ->
    $.input {
      className: @props.className
      id: @props.id
      placeholder: @props.placeholder
      onBlur: @_onBlur
      onChange: @_onChange
      onKeyDown: @_onKeyDown
      value: @state.value
      autoFocus: true
    }

  /**
   * Invokes the callback passed in as onSave, allowing this component to be
   * used in different ways.
   */
  _save: ->
    @props.onSave @state.value
    @setState value: ''

  /**
   * @param {object} event
   */
  _onChange: (event) ->
    @setState value: event.target.value

  /**
   * @param  {object} event
   */
  _onKeyDown: (event) ->
    @_save! if (event.keyCode is ENTER_KEY_CODE)
