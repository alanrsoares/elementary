Eλementary
==========

Demo: http://alanrsoares.github.io/elementary/

> LiveScript is a language which compiles to JavaScript. It has a straightforward mapping to JavaScript and allows you to write expressive code devoid of repetitive boilerplate. While LiveScript adds many features to assist in functional style programming, it also has many improvements for object oriented and imperative programming.

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
  '../../lib/elementary': $
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
