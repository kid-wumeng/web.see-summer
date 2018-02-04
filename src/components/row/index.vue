<template lang="jade">
  .Row(@click="$emit('click')")
    slot
</template>


<script lang="coffee">
</script>


<style lang="less" scoped>
  .Row{
    display: flex;
    justify-content: flex-start;
    align-items: flex-start;

    &.-right{
      justify-content: flex-end;
    }
    &.-between{
      justify-content: space-between;
    }
    &.-center{
      align-items: center;
    }
    &.-bottom{
      align-items: flex-end;
    }
  }
</style>