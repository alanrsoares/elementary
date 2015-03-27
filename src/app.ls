require! {
  react
  './components/todo-app'
  './util/elementary' : $
  'todomvc-common/base.css'
  'todomvc-app-css/index.css'
}

react.render $(todo-app), document.query-selector '.todoapp'
