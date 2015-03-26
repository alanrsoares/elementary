require! {
  react
  './components/todo'
  './util/elementary' : $
}

react.render $(todo), document.get-element-by-id 'app'
