module.exports = ->
  @exposure(15)
  @saturation(-20)
  @contrast(-10)
  @newLayer ->
    @setBlendingMode('softLight')
    @fillColor('#112787')
    @opacity(36)