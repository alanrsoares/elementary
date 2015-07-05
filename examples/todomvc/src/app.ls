require! {
  react
  elementary : $
  './components/todo-app'
  'todomvc-app-css/index.css'
}

react.render $(todo-app), document.query-selector '.todoapp'
