<template lang="jade">
  .column(@click="$emit('click')")
    slot
</template>


<script lang="coffee">
</script>


<style lang="less" scoped>
  .column{
    display: flex;
    flex-direction: column;
    justify-content: flex-start;

    &.-center{
      align-items: center;
    }
    &.-right{
      align-items: flex-end;
    }
    &.-between{
      justify-content: space-between;
    }
  }
</style>