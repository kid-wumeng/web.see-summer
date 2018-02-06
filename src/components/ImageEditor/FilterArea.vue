<template lang="jade">
  .FilterArea(v-if="dataUrl", :style="areaStyle")
    .filter(@click="$emit('select-filter', -1)")
      .wrap
        img(:src="dataUrl")
        .name 原图
    .filter(v-for="(filter, i) in filters", :key="i" @click="$emit('select-filter', i)")
      .wrap
        img(
          :id="'image-editor-filter-area-image-' + i",
          :src="dataUrl"
          data-caman-hidpi-disabled="true"
          @load="loadImage(i)"
        )
        .name {{ filter.name }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'rawDataUrl':
        type: String
        required: true
      'size':
        type: Number
        required: true

    data: ->
      dataUrl: ''

    computed:
      areaStyle: ->
        'height': @size + 42 + 'px'  # 42px是PreviewArea焦点框的padding+border-widrh

    created: ->
      @dataUrl = await @imageZoomOut(@rawDataUrl, 100, true)

    methods:
      loadImage: (i) ->
        Caman "#image-editor-filter-area-image-#{i}", ->
          filters[i].func.call(@)
          @render()
</script>


<style lang="less" scoped>
  .FilterArea{
    align-self: stretch;
    margin-left: 60px;
    width: 300px;
    overflow: scroll;
    display: flex;
    flex-wrap: wrap;
    canvas{
      display: block;
      max-width: 100px;
      max-height: 100px;
    }
    img{
      display: block;
      max-width: 100px;
      max-height: 100px;
    }
  }
</style>