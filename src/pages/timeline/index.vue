<template lang="jade">
  #timeline
    Banner
    Best
</template>


<script lang="coffee">
  module.exports =
    components:
      'Banner': require('./Banner').default
      'Best':   require('./Best').default
</script>


<style lang="less" scoped>
  #timeline{
  }
</style>