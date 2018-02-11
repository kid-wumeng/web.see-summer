<template lang="jade">
  .Step3
    .main
      Card
    .side
      ActionBar
</template>


<script lang="coffee">
  module.exports =
    components:
      'Card':      require('./Card').default
      'ActionBar': require('./ActionBar').default
</script>


<style lang="less" scoped>
  .Step3{
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