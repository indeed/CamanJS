Caman.Plugin.register "flip", (vertical) ->
  canvas = null
  ctx = null
  width = @canvas.width
  height = @canvas.height

  if typeof exports isnt "undefined" && exports isnt null ? 
    canvas = new Canvas(width, height);
  else
  canvas = document.createElement 'canvas'
  canvas.width = width
  canvas.height = height
  ctx = canvas.getContext '2d'
  ctx.translate width, 0
  ctx.scale -1, 1
  ctx.drawImage @canvas, 0, 0
  @replaceCanvas canvas
  if vertical?
    console.log "dank"
  return @

Caman.Filter.register "flip", ->
  @processPlugin "flip", Array.prototype.slice.call(arguments, 0)