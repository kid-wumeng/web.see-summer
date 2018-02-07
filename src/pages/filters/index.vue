<template lang="jade">
  #filters
    .filter(v-for="(filter, i) in filters.slice(0, 20)", :key="i")
      img(
        :id="'filters-image-' + i",
        src="/static/filter-image.png"
        data-caman-hidpi-disabled="true"
        @load="loadImage(i)"
      )
    .count {{ count }} / {{ filters.length }}
</template>


<script lang="coffee">

  StackBlur = require("stackblur-canvas")

  module.exports =
    data: ->
      count: 0

    methods:
      loadImage: (i) ->
        self = @
        Caman "#filters-image-#{i}", ->
          filters[i].func.call(@)
          @render ->
            canvas = $("#filters-image-#{i}")[0]
            # StackBlur.canvasRGBA(canvas, 0, 0, canvas.width, canvas.height, 5)
            self.count++
</script>


<style lang="less" scoped>

  @size: 60px;
  @padding: 0px;

  #filters{
    margin-top: 100px;
    margin-left: 100px;
    width: (@size + @padding) * 9;
    display: flex;
    flex-wrap: wrap;
    canvas,
    img{
      display: block;
      width: @size;
      margin-right: @padding;
      margin-bottom: @padding;
    }
    .count{
      position: fixed;
      top: 28px;
      right: 28px;
      font-size: 28px;
      font-weight: 600;
    }
  }
</style>