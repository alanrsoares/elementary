var merge = require('object-assign');
var config = require('./webpack.config.js')

module.exports = merge(config, {
  devtool: '',
  output: {
    path: __dirname + '/../dist',
    filename: 'bundle.js'
  }
});
