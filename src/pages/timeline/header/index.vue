<template lang="jade">
  .header
    .mask
      best
</template>


<script lang="coffee">
  module.exports =
    components:
      'best': require('./best').default

    mounted: ->
      $(@$el).height($(window).height())
</script>


<style lang="less" scoped>
  .header{
    width: 100%;
    background-image: url(~images/bg.jpg);
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    .mask{
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.2);
      display: flex;
      justify-content: center;
      align-items: center;
    }
  }
</style>