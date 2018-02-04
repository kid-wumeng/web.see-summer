<template lang="jade">
  .Create
    .button 珍藏 {{ date }} 的片刻
</template>


<script lang="coffee">
  module.exports =
    components:
      'Modal': require('components/Modal').default

    computed:
      date: -> @formatDate(new Date(), 'YY/MM/DD')
</script>


<style lang="less" scoped>
  .Create{
    margin-top: 120px;
    display: flex;
    justify-content: center;
    align-items: center;
    .button{
      box-sizing: border-box;
      padding: 14px 36px;
      font-weight: 500;
      font-size: 20px;
      color: rgba(255, 255, 255, 0.5);
      border: 1px solid rgba(255, 255, 255, 0.2);
      border-radius: 50px;
      cursor: pointer;
      transition: all 0.2s linear;
      pointer-events: all;
      user-select: none;
      &:hover{
        color: rgba(255, 255, 255, 1);
        border: 1px solid rgba(255, 255, 255, 1);
      }
    }
  }
</style>