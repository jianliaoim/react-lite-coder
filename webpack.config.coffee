module.exports =
  entry:
    main: [
      'webpack-dev-server/client?http://0.0.0.0:8080'
      'webpack/hot/dev-server'
      './src/example/main'
    ]
  output:
    path: 'build/'
    filename: '[name].js'
    publicPath: 'http://localhost:8080/build/'
  resolve: extensions: ['.js', '.coffee', '']
  module:
    loaders: [
      {test: /\.jsx$/, exclude: /node_modules/, loader: 'babel-loader'}
      {test: /\.coffee$/, loader: 'coffee'}
      {test: /\.css$/, loader: 'style!css'}
      {test: /\.less$/, loader: 'style!css!less'}
    ]
  plugins: []
