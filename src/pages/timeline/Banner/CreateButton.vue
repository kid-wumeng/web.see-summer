<template lang="jade">
  .CreateButton 珍藏 {{ date }} 的片刻
</template>


<script lang="coffee">
  module.exports =
    computed:
      date: -> @formatDate(new Date(), 'YY/MM/DD')
</script>


<style lang="less" scoped>
  .CreateButton{
    display: inline-block;
    margin-top: 120px;
    padding: 16px 36px;
    font-weight: 500;
    font-size: 20px;
    color: #FFF;
    border: 1px solid #FFF;
    border-radius: 50px;
    cursor: pointer;
    opacity: 0.6;
    transition: all 0.2s linear;
    pointer-events: all;
    user-select: none;
    &:hover{
      opacity: 1;
    }
  }
</style>