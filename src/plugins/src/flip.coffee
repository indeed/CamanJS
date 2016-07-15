Caman.Plugin.register "flip", (vertical = false) ->
  width = @canvas.width
  height = @canvas.height

  if typeof exports isnt "undefined" && exports isnt null
    canvas = new Canvas(width, height);
  canvas = document.createElement 'canvas'
  canvas.width = width
  canvas.height = height
  ctx = canvas.getContext '2d'
  if vertical
    ctx.translate 0, height
    ctx.scale 1, -1
  else
    ctx.translate width, 0
    ctx.scale -1, 1
  ctx.drawImage @canvas, 0, 0
  @replaceCanvas canvas

  return @

Caman.Filter.register "flip", ->
  @processPlugin "flip", Array.prototype.slice.call arguments, 0