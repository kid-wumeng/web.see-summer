<template lang="jade">
  .Create
    .button(@click="commit('create-memory-modal/SHOW')") 珍藏 {{ date }} 的片刻

    CreateMemoryModal(:open="open")
</template>


<script lang="coffee">
  module.exports =
    components:
      'CreateMemoryModal': require('components/CreateMemoryModal').default

    data: ->
      open: false

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
      user-select: none;
      &:hover{
        color: rgba(255, 255, 255, 1);
        border: 1px solid rgba(255, 255, 255, 1);
      }
    }
  }
</style>