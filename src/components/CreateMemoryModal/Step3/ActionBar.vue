<template lang="jade">
  .ActionBar
    .submit 完成
</template>


<script lang="coffee">
</script>


<style lang="less" scoped>
  .ActionBar{
    margin-top: 64px;
    display: flex;
    justify-content: center;
    align-items: center;
    .submit{
      box-sizing: border-box;
      padding: 8px 32px;
      font-weight: 500;
      font-size: 18px;
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