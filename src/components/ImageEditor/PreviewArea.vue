<template lang="jade">
  .PreviewArea
    FocusFrame.-selected(v-show="dataUrl", :padding="20")
      //- data-caman-hidpi-disabled="true"是为了能自行控制图像大小
      //- 详见：https://github.com/meltingice/CamanJS/issues/189
      img.image-editor-preview-area-image(
        :id="'image-editor-preview-area-image--1'",
        :src="dataUrl"
        data-caman-hidpi-disabled="true"
        data-has-actived="true"
      )
      img.image-editor-preview-area-image(
        v-for="(filter, i) in filters",
        :key="i",
        :id="'image-editor-preview-area-image-' + i",
        :src="dataUrl",
        data-caman-hidpi-disabled="true"
      )

    FocusFrame.-unselected(v-show="!dataUrl", :opacity="0.6")
      FileSelector(@select="selectImage", :max="10 * 1024 * 1024")
        .default(ref="default")
          .upload-hint {{ uploadHint }}

    .loading-wrap(:class="loadingClass")
      .loading-mask
        Loading
</template>


<script lang="coffee">
  module.exports =
    components:
      'FocusFrame':   require('components/FocusFrame').default
      'FileSelector': require('components/FileSelector').default
      'Loading':      require('components/Loading').default

    props:
      'uploadHint':
        type: String
        required: true

    data: ->
      size: 0
      dataUrl: ''
      loadingOpen: false

    computed:
      loadingClass: ->
        '-active': @loadingOpen

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

      preRender: ->
        for filter, i in filters
          do (i) =>
            image = $(@$el).find("#image-editor-preview-area-image-#{i}")
            if(!image.attr('data-has-actived'))
              Caman "#image-editor-preview-area-image-#{i}", ->
                filters[i].func.call(@)
                @render ->
                  $("#image-editor-preview-area-image-#{i}").attr('data-has-actived', true)

      renderByFilter: (i) ->
        el   = @$el
        swap = @swap

        if($(el).find("#image-editor-preview-area-image-#{i}").attr('data-has-actived'))
          swap(el, i)
          return

        @loadingOpen = true

        if(i > -1)
          Caman "#image-editor-preview-area-image-#{i}", ->
            filters[i].func.call(@)
            @render -> swap(el, i)

      swap: (el, i) ->
        $(el).find(".-active").removeClass('-active')
        $(el).find("#image-editor-preview-area-image-#{i}").addClass('-active').attr('data-has-actived', true)
        @loadingOpen = false
</script>


<style lang="less" scoped>
  .PreviewArea{
    position: relative;
    display: flex;
    justify-content: center;
    .FocusFrame.-selected{
      position: relative;
      display: inline-block;
      img{
        display: block;
        &:not(#image-editor-preview-area-image--1){
          position: absolute;
          top: 20px;
          left: 20px;
        }
      }
      canvas{
        display: block;
        &:not(#image-editor-preview-area-image--1){
          position: absolute;
          top: 20px;
          left: 20px;
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
    .loading-wrap{
      position: absolute;
      top: 0;
      left: 0;
      z-index: 10;
      width: 100%;
      height: 100%;
      box-sizing: border-box;
      padding: 20px;
      pointer-events: none;
      opacity: 0;
      transition: opacity 0.3s linear;
      .loading-mask{
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.8);
        display: flex;
        justify-content: center;
        align-items: center;
      }
    }
    .loading-wrap.-active{
      opacity: 1;
    }
  }
</style>