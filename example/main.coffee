require './main.less'

require 'codemirror/mode/javascript/javascript.js'
Highlight = require 'highlight.js/lib/highlight'
Highlight.registerLanguage('javascript', require('highlight.js/lib/languages/javascript'));

React = require 'react'

LiteCodeEditor = React.createFactory require('../src/index').CodeEditor
LiteCodeViewer = React.createFactory require('../src/index').CodeViewer

div = React.createFactory 'div'
p = React.createFactory 'p'

proto = """
        var jianliao = 'http://jianliao.com';

        function openJianliao() {
          window.open(jianliao);
        }

        openJianliao();
        """

App = React.createClass
  displayName: 'app'

  getInitialState: ->
    src: proto

  onEditorChange: (value) ->
    @setState src: value

  renderSelector: ->

  renderEditor: ->
    div className: 'editor',
      LiteCodeEditor
        codeType: 'javascript'
        text: @state.src
        onChange: @onEditorChange

  renderViewer: ->
    div className: 'viewer',
      LiteCodeViewer
        codeType: 'javascript'
        text: @state.src

  render: ->
    div className: 'app',
      @renderSelector()
      div className: 'section',
        p className: 'title', 'Code Editor'
        @renderEditor()
      div className: 'section',
        p className: 'title', 'Code Viewer'
        @renderViewer()

root  = React.createFactory App
mount = document.getElementById('example')

React.render root(), mount
