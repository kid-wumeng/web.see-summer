module.exports = ->
  @brightness 5

  @newLayer ->
    @setBlendingMode "multiply"
    @opacity 80
    @copyParent()

    @filter.gamma 0.8
    @filter.contrast 50
    @filter.exposure 10

  @newLayer ->
    @setBlendingMode "softLight"
    @opacity 80
    @fillColor "#f49600"

  @exposure 20
  @gamma 0.8
