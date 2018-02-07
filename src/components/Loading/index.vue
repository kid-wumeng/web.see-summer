<template lang="jade">
  .Loading
</template>


<script lang="coffee">
</script>


<style lang="less" scoped>
  .Loading {
    display: block;
    position: relative;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    border: 1px solid transparent;
    border-top-color: rgba(255, 255, 255, 0.6);
    animation: spin 0.5s linear infinite;
  }
  @keyframes spin {
    0%{
      transform: rotate(0deg);
    }
    100%{
      transform: rotate(360deg);
    }
  }

  .fade-enter-active, .fade-leave-active{
    transition: opacity .5s;
  }
  .fade-enter, .fade-leave-to{
    opacity: 0;
  }
</style>