module.exports = ->
  @sharpen 40
  @saturation -50
  @channels blue: 20

  @newLayer ->
    @setBlendingMode "multiply"
    @opacity 50
    @copyParent()

    @filter.sharpen 5
    @filter.contrast 25
    @filter.channels blue: 5