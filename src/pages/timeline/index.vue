<template lang="jade">
  #timeline
    c-header
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-header': require('./header').default
</script>


<style lang="less" scoped>
  #timeline{
  }
</style>