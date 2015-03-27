var ExtractTextPlugin = require("extract-text-webpack-plugin");

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
      { test: /\.css$/, loader: ExtractTextPlugin.extract("style-loader", "css-loader") },
      { test: /\.svg$/, loader: 'url-loader' },
      { test: /\.png$/, loader: 'url-loader' },
      { test: /\.ls$/, loader: 'livescript-loader' }
    ]
  },
  plugins: [
    new ExtractTextPlugin("style.css", {
      allChunks: true
    })
  ],
  resolve: {
    extensions: ['', '.js', '.ls']
  }
};
