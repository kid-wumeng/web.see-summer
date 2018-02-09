<template lang="jade">
  .FilterArea(v-if="dataUrl")
    .list(:style="listStyle")
      .filter(@click="$emit('select-filter', -1)")
        .wrap
          img(:src="dataUrl")
          .name RAW
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
      listStyle: ->
        'width': (filters.length + 1) * (80 + 12) + (filters.length + 2) * 8 + 'px'

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

  @size: 80px;
  @padding: 6px;

  .FilterArea{
    margin-top: 300px;
    .list{
      margin: 0 auto;
      overflow: scroll;
      .filter{
        float: left;
        position: relative;
        cursor: pointer;
        overflow: hidden;
        padding: @padding;
        width: @size;
        background-color: #FFF;
        margin-right: @padding;
        &:first-child{
          margin-left: @padding;
        }
        canvas{
          display: block;
          max-width: @size;
          max-height: @size;
        }
        img{
          display: block;
          max-width: @size;
          max-height: @size;
          width: 100%;
          height: 100%;
        }
        .name{
          margin-top: @padding;
          width: 100%;
          height: 23px;
          line-height: 24px;
          text-align: center;
          font-family: "Helvetica Neue", "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
          font-size: 12px;
          font-weight: 400;
          color: #000;
        }
      }
    }
  }
</style>