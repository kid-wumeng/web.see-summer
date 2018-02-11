<template lang="jade">
  Row.Card
    .left
      .image
    Column.right
      Content
      Row
        Location
        Weather
</template>


<script lang="coffee">
  module.exports =
    components:
      'Content':  require('./Content').default
      'Location': require('./Location').default
      'Weather':  require('./Weather').default

    mounted: ->
      size = $(@$el).parent().height() * 0.8
      $(@$el).width(size*2)
      $(@$el).height(size)
</script>


<style lang="less" scoped>

  .Card{
    .left{
      width: 50%;
      height: 100%;
      .image{
        width: 100%;
        height: 100%;
        background-image: url(~images/test-best.jpg);
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
      }
    }
    .right{
      box-sizing: border-box;
      width: 50%;
      height: 100%;
      padding: 16px;
      background-color: #FFF;
    }
  }
</style>