<template lang="jade">
  .FocusFrame(:style="rootStyle" @mouseenter="hover=true" @mouseleave="hover=false")
    slot
    .corner(:style="cornerStyle" position="left-top")
    .corner(:style="cornerStyle" position="right-top")
    .corner(:style="cornerStyle" position="right-bottom")
    .corner(:style="cornerStyle" position="left-bottom")
</template>


<script lang="coffee">
  module.exports =
    props:
      'animate':
        type: Boolean
        default: false
      'padding':
        type: Number
        default: 0
      'opacity':
        type: Number
        default: 1
      'hoverOpacity':
        type: Number
        default: 1

    data: ->
      hover: false

    computed:
      rootStyle: ->
        'padding': @padding + 'px'

      cornerStyle: ->
        'border-color': "rgba(255, 255, 255, #{if @hover then @hoverOpacity else @opacity})"
</script>


<style lang="less" scoped>

  @corner-len:   20px;
  @corner-style: 1px solid rgba(255, 255, 255, 0.6);

  .FocusFrame{
    position: relative;
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
</style>