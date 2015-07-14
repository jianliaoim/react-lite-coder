React = require 'react'

config = ['html', 'javascript']

LiteCodeEditor = React.createFactory require('../code-editor')
LiteCodeViewer = React.createFactory require('../code-viewer')

div = React.createFactory 'div'

App = React.createClass
  displayName: 'example'

  getInitialState: ->
    value: """
            function example(apple, banana) {
              return apple + banana;
            }
          """

  onChange: (value) ->
    # event.preventDefault()
    @setState value: value

  render: ->
    div className: 'example-components',
      LiteCodeEditor
        defaultValue: @state.value
        mode: 'javascript'
        onChange: @onChange
      LiteCodeViewer mode: 'javascript', @state.value
      LiteCodeViewer mode: 'css', @state.value

PageApp = React.createFactory App

React.render PageApp(), document.querySelector('.demo')
