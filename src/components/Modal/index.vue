<template lang="jade">
  transition(name="fade")
    .Modal(v-if="open", :style="modalStyle" @click.self="clickMask")
      slot
      .close(v-if="!hideClose" @click="$emit('close')")
        .icon.cancel
</template>


<script lang="coffee">
  module.exports =
    props:
      'open':
        type: Boolean
        default: false
      'hideClose':
        type: Boolean
        default: false
      'closeOnClickMask':
        type: Boolean
        default: false
      'alpha':
        type: Number
        default: 0.7


    computed:
      modalStyle: ->
        'backgroundColor': "rgba(0, 0, 0, #{@alpha})"

    watch:
      'open': (open) ->
        if(open)
          $(document.body).css('overflow', 'hidden')
          $(document.body).css('height', '100%')
        else
          $(document.body).css('overflow', 'auto')
          $(document.body).css('height', 'auto')

    methods:
      clickMask: ->
        if(@closeOnClickMask)
          @$emit('close')
</script>


<style lang="less">
  .Modal{
    position: fixed;
    top: 0;
    left: 0;
    z-index: 100;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    >.close{
      position: absolute;
      right: 0px;
      top: 0px;
      padding: 24px;
      cursor: pointer;
      opacity: 0.6;
      transition: opacity 0.2s linear;
      &:hover{
        opacity: 1;
      }
      .icon.cancel{
        width: 24px;
        height: 24px;
      }
    }
  }

  .fade-enter-active, .fade-leave-active {
    transition: opacity .5s;
  }
  .fade-enter, .fade-leave-to{
    opacity: 0;
  }
</style>