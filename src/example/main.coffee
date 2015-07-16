require './example.less'
require 'codemirror/lib/codemirror.css'
require 'codemirror/addon/display/placeholder'
require 'codemirror/mode/meta'
require 'codemirror/mode/css/css.js'
require 'codemirror/mode/htmlmixed/htmlmixed.js'
require 'codemirror/mode/javascript/javascript.js'

_ = require 'lodash'
React = require 'react'
CodeMirror = require 'codemirror'

LiteCodeEditor = React.createFactory require('../code-editor')
LiteCodeViewer = React.createFactory require('../code-viewer')

div = React.createFactory 'div'
option = React.createFactory 'option'
select = React.createFactory 'select'

App = React.createClass
  displayName: 'example'

  getDefaultProps: ->
    defaultMode: 'null'

  getInitialState: ->
    src:  """
            function example(a, b) {
              return a + b;
            }

            // more code here...
          """
    mode: @props.defaultMode
    modeNames: [
      'Plain Text',
      'CSS',
      'HTML',
      'Javascript'
    ]

  onSelectorChange: (event) ->
    @setState mode: event.target.value

  onEditorChange: (value) ->
    @setState src: value

  renderSelector: ->
    div className: 'mode-selector',
      select defaultValue: 'text', onChange: @onSelectorChange,
        _.map @state.modeNames, (modeName) =>
          mode = CodeMirror.findModeByName modeName
          option key: modeName, value: mode.mode, modeName

  renderEditor: ->
    div className: 'editor',
      LiteCodeEditor
        defaultValue: @state.src
        mode: @state.mode
        onChange: @onEditorChange

  render: ->
    div className: 'app',
      @renderSelector()
      @renderEditor()

PageApp = React.createFactory App

React.render PageApp(), document.querySelector('.example')
