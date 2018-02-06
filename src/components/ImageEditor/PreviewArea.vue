<template lang="jade">
  .PreviewArea
    FocusFrame.-selected(v-show="dataUrl", :padding="20")
      //- data-caman-hidpi-disabled="true"是为了能自行控制图像大小
      //- 详见：https://github.com/meltingice/CamanJS/issues/189
      img.image-editor-preview-area-image(
        :id="'image-editor-preview-area-image-origin'",
        :src="dataUrl"
        data-caman-hidpi-disabled="true"
      )
      img.image-editor-preview-area-image(
        v-for="(filter, i) in filters",
        :key="i",
        :id="'image-editor-preview-area-image-' + i",
        :src="dataUrl",
        data-caman-hidpi-disabled="true"
      )

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

    data: ->
      size: 0
      dataUrl: ''

    mounted: ->
      width  = $(window).width()
      height = $(window).height()

      if(width < height)
        min = width
      else
        min = height

      @size = parseInt(min * 0.7)
      @$emit('sure-size', @size)

      $('.image-editor-preview-area-image').css('maxWidth',  @size)
      $('.image-editor-preview-area-image').css('maxHeight', @size)
      $(@$refs.default).css('width',  @size)
      $(@$refs.default).css('height', @size)

    methods:
      selectImage: (file) ->
        rawDataUrl = await @readDataUrl(file)
        @dataUrl   = await @imageZoomOut(rawDataUrl, @size)
        @$emit('select-image', rawDataUrl)

      renderByFilter: (i) ->
        $(@$el).find(".-active").removeClass('-active')
        $(@$el).find("#image-editor-preview-area-image-#{i}").addClass('-active')

        if(i > -1)
          Caman "#image-editor-preview-area-image-#{i}", ->
            filters[i].func.call(@)
            @render()
</script>


<style lang="less" scoped>
  .PreviewArea{
    .FocusFrame.-selected{
      position: relative;
      img{
        display: block;
        &:not(#image-editor-preview-area-image-origin){
          position: absolute;
          top: 20px;
          bottom: 0;
        }
      }
      canvas{
        display: block;
        &:not(#image-editor-preview-area-image-origin){
          position: absolute;
          top: 20px;
          bottom: 0;
          z-index: -1;
        }
        &.-active{
          z-index: 1 !important;
        }
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