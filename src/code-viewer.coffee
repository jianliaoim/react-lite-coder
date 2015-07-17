_ = require 'lodash'
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
    mode: T.string
    name: T.string

  getDefaultProps: ->
    mode: 'nohighlight'

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

  render: ->
    className = cx 'lite-code-viewer',
      "is-for-#{@props.name}": @props.name?

    div className: className, ref: 'highlighter',
      pre className: 'pre',
        code className: @props.mode, @props.children
