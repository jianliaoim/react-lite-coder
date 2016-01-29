require './main.less'

codemirror = require 'codemirror'
hljs = require 'highlight.js/lib/highlight'
React = require 'react'
ReactDOM = require 'react-dom'

LiteCodeEditor = React.createFactory require('../src/index').CodeEditor
LiteCodeViewer = React.createFactory require('../src/index').CodeViewer

require 'codemirror/mode/css/css'
require 'codemirror/mode/htmlmixed/htmlmixed'
require 'codemirror/mode/javascript/javascript'

hljs.registerLanguage('css', require('highlight.js/lib/languages/css'));
hljs.registerLanguage('html', require('highlight.js/lib/languages/xml'));
hljs.registerLanguage('javascript', require('highlight.js/lib/languages/javascript'));

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
        configs.map (config, index) =>
          option key: index, value: index, config.name

  renderEditor: ->
    div className: 'editor',
      LiteCodeEditor
        codeType: @state.cm
        text: @state.src
        onChange: @onEditorChange

  renderViewer: ->
    div className: 'viewer',
      LiteCodeViewer
        codeType: @state.hl
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

ReactDOM.render root(), mount
