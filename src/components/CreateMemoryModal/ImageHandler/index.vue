<template lang="jade">
  .ImageHandler(@dragstart.prevent="function(){}")
    //- data-caman-hidpi-disabled="true"是为了能自行控制图像大小
    //- 详见：https://github.com/meltingice/CamanJS/issues/189
    img.raw(
      :src="dataUrl"
      data-caman-hidpi-disabled="true"
      @load="loadImage"
    )
    img.filter(
      v-for="(filter, i) in filters",
      :key="i",
      :id="'image-handler-filter-' + i",
      :src="dataUrl",
      data-caman-hidpi-disabled="true"
    )

    .mask-top(ref="top")
    .mask-bottom(ref="bottom")
    .mask-left(ref="left")
    .mask-right(ref="right")

    .loading-mask(:class="loadingClass")
      Loading
</template>


<script lang="coffee">
  module.exports =
    components:
      'Loading': require('components/Loading').default

    props:
      'rawDataUrl':
        type: String
        required: true

    data: ->
      dataUrl: ''
      loadingOpen: false

    computed:
      loadingClass: ->
        '-active': @loadingOpen

    mounted: ->
      @initSize()

    methods:
      initSize: ->
        height = $(@$el).parent().height() * 0.8

        $(@$el).find('img').css('max-height', height)
        $(@$el).find('canvas').css('max-height', height)

        @dataUrl = await @imageZoomOut(@rawDataUrl, 600)

      loadImage: (e) ->
        width  = Math.ceil(e.target.width)
        height = Math.ceil(e.target.height)
        over   = Math.ceil(Math.abs(width - height) / 2)
        color  = 'rgba(0, 0, 0, 0.6)'

        if(width < height)
          $(@$refs.top).css({
            'width': width
            'height': over
            'background-color': color
          })
          $(@$refs.bottom).css({
            'width': width
            'height': over
            'background-color': color
          })
        else
          $(@$refs.left).css({
            'width': over
            'height': height + 1
            'background-color': color
          })
          $(@$refs.right).css({
            'width': over
            'height': height + 1
            'background-color': color
          })

      selectFilter: (i) ->
        if(i is -1)
          @swap(i)
        else
          if($(@$el).find("#image-handler-filter-#{i}").attr('rendered'))
            @swap(i)
          else
            @loadingOpen = true
            await @render(i)
            $(@$el).find("#image-handler-filter-#{i}").attr('rendered', true)
            @loadingOpen = false
            @swap(i)

      render: (i) ->
        return new Promise (resolve) ->
          Caman "#image-handler-filter-#{i}", ->
            filters[i].func.call(@)
            @render(resolve)

      swap: (i) ->
        root = $(@$el)
        root.find(".-active").removeClass('-active')
        if(i is -1)
          root.find('.raw').addClass('-active')
        else
          root.find("#image-handler-filter-#{i}").addClass('-active')
</script>


<style lang="less" scoped>

  .ImageHandler{
    display: flex;
    justify-content: center;
    align-items: center;
    user-select: none;
    position: relative;
    border: 1px solid rgba(255, 255, 255, 1);
    overflow: hidden;
    img{
      display: block;
    }
    img:not(.raw),
    canvas{
      position: absolute;
      display: block;
      z-index: -1;
      &.-active{
        z-index: 1;
      }
    }
    .mask-top{
      position: absolute;
      top: 0;
      z-index: 10;
    }
    .mask-bottom{
      position: absolute;
      bottom: 0;
      z-index: 10;
    }
    .mask-left{
      position: absolute;
      left: 0;
      z-index: 10;
    }
    .mask-right{
      position: absolute;
      right: 0;
      z-index: 10;
    }
    .loading-mask{
      position: absolute;
      top: 0;
      left: 0;
      z-index: 10;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.8);
      pointer-events: none;
      display: flex;
      justify-content: center;
      align-items: center;
      opacity: 0;
      transition: opacity 0.3s linear;
    }
    .loading-mask.-active{
      opacity: 1;
    }
  }
</style>