React = require 'react'

LiteCodeEditor = React.createFactory require('../../lib/index').CodeEditor
# or
# LiteCodeEditor = React.createFactory require '../../lib/code-editor'

LiteCodeViewer = React.createFactory require('../../lib/index').CodeViewer
# or
# LiteCodeViewer = React.createFactory require '../../lib/code-viewer'

App = React.createClass
  displayName: 'example'

  render: ->

PageApp = React.createFactory App

React.render PageApp(), document.querySelector('.demo')
