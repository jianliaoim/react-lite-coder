cx = require 'classnames'
hljs = require 'highlight.js/lib/highlight'
React = require 'react'

T = React.PropTypes

code = React.createFactory 'code'
div = React.createFactory 'div'
pre = React.createFactory 'pre'

module.exports = React.createClass
  displayName: 'lite-code-viewer'

  propTypes:
    content: T.string
    mode:    T.string
    name:    T.string

  getDefaultProps: ->
    content: ''
    mode:    'nohighlight'

  componentDidMount: ->
    @highlightCode()

  componentDidUpdate: ->
    @highlightCode()

  highlightCode: ->
    if @props.mode isnt 'nohighlight'
      highlighter = @refs.highlighter.getDOMNode()
      codes = highlighter.querySelectorAll 'pre code'
      if codes?.length
        codes.forEach (code) ->
          hljs.highlightBlock(code)

  render: ->
    className = cx
      'lite-code-viewer': true
      "is-for-#{@props.name}": @props.name?

    if @props.children?
      content = @props.children
    else
      content = @props.content

    div className: className, ref: 'highlighter',
      pre,
        code className: @props.mode, content
