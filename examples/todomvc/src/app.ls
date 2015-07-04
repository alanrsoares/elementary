require! {
  react
  './components/todo-app'
  'elementary' : $
  'todomvc-app-css/index.css'
}

react.render $(todo-app), document.query-selector '#app'
