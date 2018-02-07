<template lang="jade">
  .FilterArea(v-if="dataUrl", :style="areaStyle")
    .filter(@click="$emit('select-filter', -1)")
      .wrap
        img(:src="dataUrl")
        .name
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
      renderCount: 0

    computed:
      areaStyle: ->
        'height': @size + 40 + 'px'  # 40px是PreviewArea焦点框的padding

    created: ->
      @dataUrl = await @imageZoomOut(@rawDataUrl, 120, true)

    methods:
      loadImage: (i) ->
        self = @
        Caman "#image-editor-filter-area-image-#{i}", ->
          filters[i].func.call(@)
          @render ->
            self.renderCount++
            if(self.renderCount is filters.length)
              self.$emit('ready-filters')
</script>


<style lang="less" scoped>
  .FilterArea{
    align-self: stretch;
    margin-left: 100px;
    box-sizing: border-box;
    width: 300px + 12px + 36px;
    overflow: scroll;
    .filter{
      float: left;
      position: relative;
      cursor: pointer;
      overflow: hidden;
      width: 100px;
      background-color: #000;
      padding: 6px;
      margin-top: 6px;
      margin-left: 6px;
      &:nth-child(1),
      &:nth-child(2),
      &:nth-child(3){
        margin-top: 0;
      }
      &:nth-child(3n+1){
        margin-left: 0;
      }
      canvas{
        display: block;
        max-width: 100px;
        max-height: 100px;
      }
      img{
        display: block;
        max-width: 100px;
        max-height: 100px;
        width: 100%;
        height: 100%;
      }
      .name{
        margin-top: 6px;
        width: 100%;
        height: 24px;
        line-height: 24px;
        text-align: center;
        font-family: "Helvetica Neue", "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
        font-size: 12px;
        font-weight: 400;
        color: #FFF;
      }
    }
  }
</style>