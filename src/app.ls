require! {
  react
  './components/app' : app
  './util/elementary' : $
}

react.render $(app), document.get-element-by-id 'app'
