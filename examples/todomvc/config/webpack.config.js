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
    modulesDirectories: ['node_modules', 'src'],
    extensions: ['', '.js', '.ls']
  }
};
