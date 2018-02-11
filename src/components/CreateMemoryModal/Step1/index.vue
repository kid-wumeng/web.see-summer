<template lang="jade">
  .Step1
    .main
      ImageSelector(@select="select")
    .side
      DescArea
</template>


<script lang="coffee">
  module.exports =
    components:
      'ImageSelector': require('./ImageSelector').default
      'DescArea':      require('./DescArea').default

    methods:
      'select': (dataUrl) ->
        @$emit('select', dataUrl)
</script>


<style lang="less" scoped>
  .Step1{
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    .main{
      flex: auto;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .side{
      flex: none;
      box-sizing: border-box;
      width: 100%;
      padding: 0 5%;
      height: 160px;
      background-color: rgba(0, 0, 0, 0.6);
    }
  }
</style>