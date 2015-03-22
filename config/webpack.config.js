module.exports = {
  context: __dirname + '/../src',
  entry: './app.js',
  output: {
    path: __dirname + '/../build',
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      { test: /\.scss$/, loader: "style!css!sass" },
      { test: /\.svg$/, loader: "url-loader" },
      { test: /\.js$/, loader: 'babel-loader' }
    ]
  }
};
