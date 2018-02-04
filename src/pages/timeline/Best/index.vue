<template lang="jade">
  .Best
    .wrap
      .title BEST IN TODAY
      Card
    DropdownHint
</template>


<script lang="coffee">
  module.exports =
    components:
      'Card':         require('./Card').default
      'DropdownHint': require('components/DropdownHint').default

    mounted: ->
      $(@$el).height($(window).height())
</script>


<style lang="less" scoped>
  .Best{
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    .wrap{
      position: absolute;
      .title{
        text-align: center;
        font-size: 24px;
        font-weight: 600;
        margin-bottom: 72px;
      }
    }
    .DropdownHint{
      position: absolute;
      bottom: 30px;
    }
  }
</style>