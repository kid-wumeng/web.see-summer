<template lang="jade">
  .PreviewArea
    FocusFrame.-selected(v-show="dataUrl", :padding="20")
      //- data-caman-hidpi-disabled="true"是为了能自行控制图像大小
      //- 详见：https://github.com/meltingice/CamanJS/issues/189
      img#preview-area-img(ref="img", :src="dataUrl" @load="loadImage" data-caman-hidpi-disabled="true")

    FocusFrame.-unselected(v-show="!dataUrl", :opacity="0.6")
      FileSelector(@select="selectImage")
        .default(ref="default")
          .upload-hint {{ uploadHint }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'FocusFrame':   require('components/FocusFrame').default
      'FileSelector': require('components/FileSelector').default

    props:
      'uploadHint':
        type: String
        required: true
      'dataUrl':
        type: String
        required: true

    data: ->
      size: 0

    computed:
      imgStyle: ->
        'backgroundImage': "url(#{@dataUrl})"

    mounted: ->
      width  = $(window).width()
      height = $(window).height()
      if(width < height)
        min = width
      else
        min = height
        
      @size = parseInt(min * 0.7)
      @$refs.img.style.maxWidth   = @size + 'px'
      @$refs.img.style.maxHeight  = @size + 'px'
      @$refs.default.style.width  = @size + 'px'
      @$refs.default.style.height = @size + 'px'

    methods:
      selectImage: (file) ->
        dataUrl = await @readDataUrl(file)
        @$emit('select-image', dataUrl)

      loadImage: (e) ->
        Caman '#preview-area-img', ->
          @glowingSun()
          @render()
</script>


<style lang="less" scoped>
  .PreviewArea{
    .FocusFrame.-selected{
      img{
        display: block;
      }
    }
    .FocusFrame.-unselected{
      .default{
        background-image: url(~images/camera.png);
        background-repeat: no-repeat;
        background-position: center;
        background-size: 50px;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
        opacity: 0.6;
        transition: opacity 0.2s linear;
        &:hover{
          opacity: 1;
        }
        .upload-hint{
          position: relative;
          top: 44px;
          font-size: 12px;
        }
      }
    }
  }
</style>