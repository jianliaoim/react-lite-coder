webpack = require 'webpack'

module.exports =
  entry:
    vendor: [
      'webpack-dev-server/client?http://0.0.0.0:8080'
      'webpack/hot/dev-server'
    ]
    main: [
      './example/main'
    ]
  output:
    path: 'build/'
    filename: '[name].js'
    publicPath: 'http://localhost:8080/build/'
  resolve: extensions: ['.js', '.coffee', '']
  module:
    loaders: [
      {test: /\.coffee$/, loader: 'react-hot!coffee'}
      {test: /\.less$/, loader: 'style!css!less'}
      {test: /\.css$/, loader: 'style!css!autoprefixer'}
    ]
  plugins: [
    new webpack.optimize.CommonsChunkPlugin 'vendor', 'vendor.js'
  ]
