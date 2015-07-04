Eλementary
==========

Demo: http://alanrsoares.github.io/elementary/

## Features
- LiveScript
- ReactJs
- Eλementary - A minimal templating engine for React - NO JSX REQUIRED
- WebPack Module Bundler
- Webpack Development Server (with livereload)
- Alt Flux

## Prerequisites:

- node.js: `brew install node`

## Application Dependencies

All the dependencies required for the build system, testing and so on are managed with npm and defined in `package.json`.
They can be installed with:

```bash
$ npm install
```

## Running the Application

You can run `npm start` to fire up the application on `http://localhost:8080`
or `http://localhost:8080/webpack-dev-server/` (with live reload).

## Example React component

> Without JSX - elementary lib

```LiveScript
require! {
  'elementary': $
}

module.exports = $.component
  render: ->
    $.h1 {} "Hello, #{@props.name}!"
```

> With JSX

Install babel-loader
```bash
$ npm i babel-loader --save-dev
```

Add babel-loader to the 'ls' loader pipeline in [config/webpack.config.js](../master/config/webpack.config.js#L17)
```javascript
{ test: /\.ls$/, loader: 'babel-loader!livescript-loader' }
```

```LiveScript
require! react: {Component}

module.exports = class Hello extends Component
  render: ->
    ``<h1>Hello, {this.props.name}!</h1>``
```

## TODO:

- Configure Jest
- Add unit tests
- Achieve 100% code coverage
