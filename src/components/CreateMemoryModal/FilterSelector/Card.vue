<template lang="jade">
  .Card
    img(:id="'filter-selector-filter-' + index", :src="dataUrl" @load="load")
    .name {{ name }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'dataUrl':
        type: String
        required: true
      'index':
        type: Number
        required: true

    computed:
      name: ->
        if(@index is -1)
          return '原始图像'
        else
          return @filters[@index].name

    methods:
      load: ->
        i = @index
        if(i > -1)
          Caman "#filter-selector-filter-#{i}", ->
            filters[i].func.call(@)
            @render()
</script>


<style lang="less" scoped>

  @size: 80px;
  @padding: 4px;

  .Card{
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
      height: 21px;
      line-height: 22px;
      text-align: center;
      font-family: "Helvetica Neue", "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
      font-size: 12px;
      font-weight: 400;
      color: #4A4A4A;
      user-select: none;
    }
  }
</style>