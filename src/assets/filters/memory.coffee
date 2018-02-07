module.exports = ->
  @curves 'rgb', [0, 0], [100, 50], [140, 200], [255, 255]
  @vibrance -30
  @saturation -60
  @colorize '#ff9000', 25
  @contrast -5
  @gamma 1.4
  @noise(2)
  @vignette('50%', 30)