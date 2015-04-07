require! {
  react
  './html-tags'
}

REACT_ELEMENT_PROPERTIES = <[ type key ref _owner _context ]>

has-own-property = (obj) ->
  (check, prop) -> check and obj.has-own-property prop

has-all-properties = (props, obj) -->
  props.reduce has-own-property obj, false

is-react-element = (obj) ->
  !!obj and
    obj |> has-all-properties REACT_ELEMENT_PROPERTIES

slice = (args, index) -> [].slice.call args, index or 0

builder = (tag) -->
  args = slice(arguments, 1)

  args.1 = args.0 if typeof args.0 is \string or
                     is-react-element args.0

  args.0 = {} if typeof args.0 is \undefined or
                 typeof args.0 is \string or
                 is-react-element args.0

  react.create-element.apply(this, [tag] ++ args)

composer = (reduced, tag) ->
  reduced[tag] = ->
    builder.apply(this, [tag] ++ slice arguments)
  reduced

elementary = html-tags.reduce(composer, builder)

elementary.component = react.create-class

module.exports = elementary
