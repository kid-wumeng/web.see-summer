<template lang="jade">
  transition(name="fade")
    .Modal(v-show="open" @click.self="clickMask")
      slot
      .close(@click="$emit('close')")
        .icon.cancel
</template>


<script lang="coffee">
  module.exports =
    props:
      'open':
        type: Boolean
        default: false
      'closeOnClickMask':
        type: Boolean
        default: false

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


<style lang="less" scoped>
  .Modal{
    position: fixed;
    top: 0;
    left: 0;
    z-index: 100;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
    >.close{
      position: absolute;
      right: 0px;
      top: 0px;
      padding: 32px;
      cursor: pointer;
      opacity: 0.6;
      transition: opacity 0.2s linear;
      &:hover{
        opacity: 1;
      }
      .icon.cancel{
        width: 32px;
        height: 32px;
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