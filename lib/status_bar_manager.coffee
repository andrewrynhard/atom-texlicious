ContentsByMode =
  'ready': ["status-bar-latex-plus-mode-compile", "Ready"]
  'compile': ["status-bar-latex-plus-mode-compile", "Compiling ... "]
  'error': ["status-bar-latex-plus-mode-error", "Error"]

module.exports =
class StatusBarManager
  constructor: ->
    @element = document.createElement("div")
    @element.id = "status-bar-latex-plus-mode"

    @container = document.createElement("div")
    @container.className = "inline-block"
    @container.appendChild(@element)

  initialize: (@statusBar) ->

  project: null

  update: (mode) ->
    if newContents = ContentsByMode[mode]
      [klass, status] = newContents
      @element.className = klass
      @element.textContent = "#{@project}: #{status}"

  # Private

  attach: ->
    @tile = @statusBar.addLeftTile(item: @container, priority: 20)

  detach: ->
    @tile.destroy()

  destroy: =>
    @element?.remove()
    @element = null
    @container?.remove()
    @container = null
