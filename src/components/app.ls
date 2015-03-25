require! {
  react: {Component}
  './hello'
  '../util/elementary': $
}

module.exports = class App extends Component
  render: -> $ hello, { name:'LiveScript' }
