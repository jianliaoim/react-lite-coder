require './demo.less'

_ = require 'lodash'
React = require 'react'
CodeMirror = require 'codemirror'
require 'codemirror/addon/display/placeholder'
require 'codemirror/mode/css/css.js'
require 'codemirror/mode/htmlmixed/htmlmixed.js'
require 'codemirror/mode/javascript/javascript.js'

Highlight = require 'highlight.js/lib/highlight'
Highlight.registerLanguage('css', require('highlight.js/lib/languages/css'));
Highlight.registerLanguage('html', require('highlight.js/lib/languages/xml'));
Highlight.registerLanguage('javascript', require('highlight.js/lib/languages/javascript'));

LiteCodeEditor = React.createFactory require('../src/index').CodeEditor
LiteCodeViewer = React.createFactory require('../src/index').CodeViewer

div    = React.createFactory 'div'
option = React.createFactory 'option'
p      = React.createFactory 'p'
select = React.createFactory 'select'
span   = React.createFactory 'span'

configs = [
  { name: 'Plain Text', cm: 'null',       hl: 'nohighlight' }
  { name: 'CSS',        cm: 'css',        hl: 'css' }
  { name: 'HTML',       cm: 'htmlmixed',  hl: 'html' }
  { name: 'JavaScript', cm: 'javascript', hl: 'javascript' }
]

App = React.createClass
  displayName: 'app'

  getInitialState: ->
    src:  """
            function example(a, b) {
              return a + b;
            }

            // more code here...
          """
    name: configs[0].name
    cm: configs[0].cm
    hl: configs[0].hl

  onSelectorChange: (event) ->
    i = event.target.value
    @setState
      name: configs[i].name
      cm: configs[i].cm
      hl: configs[i].hl

  onEditorChange: (value) ->
    @setState src: value

  renderSelector: ->
    div className: 'selector',
      p null, 'Select one mode, then you\'ll see how it works.'
      span null, 'Mode:'
      select defaultValue: 'text', onChange: @onSelectorChange,
        _.map configs, (config, index) =>
          option key: index, value: index, config.name

  renderEditor: ->
    div className: 'editor',

      LiteCodeEditor
        defaultValue: @state.src
        mode: @state.cm
        onChange: @onEditorChange

  renderViewer: ->
    div className: 'viewer',
      LiteCodeViewer
        mode: @state.hl,
        @state.src

  render: ->
    div className: 'app',
      @renderSelector()
      p null, 'Code Editor'
      @renderEditor()
      p null, 'Code Viewer'
      @renderViewer()

root  = React.createFactory App
mount = document.getElementById('app')

React.render root(), mount
