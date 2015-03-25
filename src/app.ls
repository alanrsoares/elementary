require! {
  react
  './components/app' : app
  './util/element' : $
}

react.render $(app), document.get-element-by-id 'app'
