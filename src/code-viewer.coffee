_ = require 'lodash'
hljs = require 'highlight.js'
React = require 'react'

# theme
require 'highlight.js/styles/default.css'

code = React.createFactory 'code'
div = React.createFactory 'div'
option = React.createFactory 'option'
pre = React.createFactory 'pre'
select = React.createFactory 'select'

module.exports = React.createClass
  displayName: 'lite-code-viewer'

  componentDidMount: ->
    @highlightCode()

  componentDidUpdate: ->
    @highlightCode()

  highlightCode: ->
    highlighter = @refs.highlighter.getDOMNode()
    codes = highlighter.querySelectorAll 'pre code'
    if codes.length?
      _.forEach codes, (code) ->
        hljs.highlightBlock(code)

  renderSelector: ->
    

  render: ->
    className = "lite-code-viewer is-for-#{@props.name}"

    div className: className, ref: 'highlighter',
      pre null,
        code className: @props.mode, @props.children
