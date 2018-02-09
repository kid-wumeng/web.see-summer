<template lang="jade">
  .ImageSelector
    FileSelector(@select="select")
      .wrap
        .icon.camera
        .hint {{ hint }}
    .corner(position="left-top")
    .corner(position="right-top")
    .corner(position="right-bottom")
    .corner(position="left-bottom")
</template>


<script lang="coffee">
  module.exports =
    components:
      'FileSelector': require('components/FileSelector').default

    props:
      'hint':
        type: String
        default: 'UPLOAD PHOTO'

    mounted: ->
      size = $(@$el).parent().height() * 0.8
      $(@$el).width(size)
      $(@$el).height(size)

    methods:
      'select': (file) ->
        dataUrl = await @readDataUrl(file)
        @$emit('select', dataUrl)
</script>


<style lang="less" scoped>

  @corner-len:   20px;
  @corner-style: 1px solid rgba(255, 255, 255, 0.6);

  .ImageSelector{
    position: relative;
    box-sizing: border-box;
    cursor: pointer;
    .FileSelector{
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      opacity: 0.6;
      transition: opacity 0.2s linear;
      .wrap{
        .icon{
          margin: 0 auto;
          width: 48px;
          height: 48px;
        }
        .hint{
          margin-top: 12px;
          font-size: 13px;
        }
      }
    }
    .corner{
      position: absolute;
      width:  @corner-len;
      height: @corner-len;
      transition: border-color 0.2s linear;
    }
    .corner[position="left-top"]{
      top:         0;
      left:        0;
      border-left: @corner-style;
      border-top:  @corner-style;
    }
    .corner[position="right-top"]{
      top:          0;
      right:        0;
      border-right: @corner-style;
      border-top:   @corner-style;
    }
    .corner[position="right-bottom"]{
      bottom:        0;
      right:         0;
      border-right:  @corner-style;
      border-bottom: @corner-style;
    }
    .corner[position="left-bottom"]{
      bottom:        0;
      left:          0;
      border-left:   @corner-style;
      border-bottom: @corner-style;
    }
  }

  .ImageSelector:hover{
    .FileSelector{
      opacity: 1;
    }
    .corner{
      border-color: rgba(255, 255, 255, 1);
    }
  }
</style>