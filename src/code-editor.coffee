_ = require 'lodash'
CodeMirror = require 'codemirror'
React = require 'react'

# theme
require 'codemirror/lib/codemirror.css'

# mode
configs = require './config'
_.forEach configs, (value, index) ->
  key = value.key
  require "codemirror/mode/#{key}/#{key}.js"

T = React.PropTypes

div = React.createFactory 'div'
option = React.createFactory 'option'
select = React.createFactory 'select'
textarea = React.createFactory 'textarea'

module.exports = React.createClass
  displayName: 'lite-code-editor'

  propTypes:
    defaultValue: T.string
    mode: T.string
    name: T.string
    readOnly: T.bool
    value: T.string
    onChange: T.func

  getInitialState: ->
    config:
      lineNumbers: true
      mode: @props.mode or 'null'
      theme: 'default'

  componentDidMount: ->
    editor = @refs.editor.getDOMNode()
    @editor = CodeMirror.fromTextArea editor, @state.config
    @editor.on 'change', @onEditorChange

  componentDidUpdate: ->
    # if @editor?
    #   if @props.value?
    #     if @editor.getValue() isnt @props.value
    #       @editor.setValue @props.value

  onEditorChange: ->
    value = @editor.getValue()
    @props.onChange value

  onSelectorChange: (event) ->
    mode = event.target.value
    @editor.setOption 'mode', mode
    @setState
      config:
        mode: event.target.value

  renderEditor: ->
    textarea
      className: 'editor'
      defaultValue: @props.defaultValue
      onChange: @props.onChange
      readOnly: @props.readOnly
      ref: 'editor'
      value: @props.value

  renderSelector: ->
    options = _.map configs, (config, index) ->
      option key: index, value: config.key, config.name

    select className: 'editor-mode', onChange: @onSelectorChange, value: @state.config.mode,
      option value: 'null', 'Text'
      options

  render: ->
    className = "lite-code-editor is-for-#{@props.name}"

    div className: className,
      @renderEditor()
      @renderSelector()
