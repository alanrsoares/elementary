require! {
  react: {Component, PropTypes:types}
  '../util/elementary' : $
  './header'
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
      $(header)
      # footer
      $.div {className: 'todo-footer'},
        "I'm in the footer, bitch!"
