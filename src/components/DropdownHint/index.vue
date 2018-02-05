<template lang="jade">
  .DropdownHint
</template>


<script lang="coffee">
</script>


<style lang="less">

  @keyframes animation
  {
    0%{
      transform: translateY(0);
    }
    25%{
      transform: translateY(-4px);
    }
    50%{
      transform: translateY(0);
    }
    75%{
      transform: translateY(4px);
    }
    100%{
      transform: translateY(0);
    }
  }

  @width:  16px;
  @height: @width / 1;

  .DropdownHint{
    width: @width;
    height: @height;
    background-image: url(~images/arrow-double-down.png);
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    animation: animation 1s linear infinite;
  }
</style>
