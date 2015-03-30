require! {
  react
  './components/todo-app'
  './util/elementary' : $
  'todomvc-app-css/index.css'
}

react.render $(todo-app), document.query-selector '#app'
