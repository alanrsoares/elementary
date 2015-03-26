require! {
  react
  './components/todo-app'
  './util/elementary' : $
}

react.render $(todo-app), document.get-element-by-id 'app'
