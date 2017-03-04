var webpack = require('webpack');

module.exports = {
  entry: './widgets.jsx',
  devtool: 'source-map',
  output: {
    filename: 'bundle.js'
  },
  resolve: {
    extensions: ['.js', '.jsx', "*"]
  },
  module: {
  loaders: [
    {
      test: [/\.jsx?$/],
      exclude: /(node_modules)/,
      loader: 'babel-loader',
      query: {
        presets: ['es2015', 'react']
      }
    }
  ]
  }
};
