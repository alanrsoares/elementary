require! {
  react: {Component, PropTypes:types}
  '../util/elementary' : $
}

module.exports = class Todo extends Component
  ->
    this.state = { items: [] }

  @prop-types =
    name: types.string

  list-item: (n) ->
    $.li { className:'item' },
      $.a {href:"#/dummy/#n"} "dummy link #n"

  render: ->
    $.div { className: 'todo-container' },
      # header
      $.div { className: 'todo-header' },
        $.h1 {} 'What needs to be done?'
      # body
      $.div {className: 'todo-body'},
        $.div {},
          $.input {
            type:'text'
            placeholder:'What needs to be done?'
            onKeyUp: -> console.log @
          }
        $.span {} 'foo'
      # footer
      $.div {className: 'todo-footer'},
        "I'm in the footer, bitch!"
