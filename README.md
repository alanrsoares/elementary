React LiveScript Starter Kit
============================

## Prerequisites:

- node.js: `brew install node`

## Application Dependencies

All the dependencies required for the build system, testing and so on are managed with npm and defined in `package.json`.
They can be installed with:

```
npm install
```

## Running the Application

You can run `npm start` to fire up the application on `http://localhost:8080`
or `http://localhost:8080/webpack-dev-server/` (with live reload).

## Example React component

> Without JSX

```LiveScript
require React from 'react'
require $ from '../util/element'

module.exports = React.createClass do
  render: ->
    $ 'h1' {} "Hello, #{@props.name}!"
```

> With JSX

```LiveScript
require React from 'react'

module.exports = React.createClass do
  render: ->
    ``<h1>Hello, {this.props.name}!</h1>``
```
