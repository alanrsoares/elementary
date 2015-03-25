module.exports = {
  context: __dirname + '/../src',
  entry: './app.ls',
  devtool: "#inline-source-map",
  output: {
    path: __dirname + '/../build',
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      { test: /\.scss$/, loader: 'style!css!sass' },
      { test: /\.svg$/, loader: 'url-loader' },
      { test: /\.ls$/, loader: 'babel-loader!livescript-loader' }
    ]
  },
  resolve: {
    extensions: ['', '.js', '.ls']
  }
};
