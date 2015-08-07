cx = require 'classnames'
hljs = require 'highlight.js/lib/highlight'
React = require 'react'

code = React.createFactory 'code'
div = React.createFactory 'div'
pre = React.createFactory 'pre'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'lite-code-viewer'

  propTypes:
    codeType: T.string
    name: T.string
    text: T.string

  getDefaultProps: ->
    codeType: 'nohighlight'
    text: ''

  componentDidMount: ->
    @highlightConfig()
    @highlightCode()

  componentDidUpdate: ->
    @highlightCode()

  highlightConfig: ->
    hljs.configure
      tabReplace: '  '

  highlightCode: ->
    return if @props.codeType is 'nohighlight'
    viewer = @refs.viewer.getDOMNode()
    snippets = viewer.querySelectorAll 'pre code'
    hljs.highlightBlock snippet for snippet in snippets

  render: ->
    className = cx
      'lite-code-viewer': true
      "is-for-#{ @props.name }": @props.name?

    div className: className, ref: 'viewer',
      pre null,
        code className: @props.codeType, @props.text
