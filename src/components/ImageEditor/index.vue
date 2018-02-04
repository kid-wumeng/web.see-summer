<template lang="jade">
  .ImageEditor
</template>


<script lang="coffee">
  module.exports =
    components:
      'Modal': require('components/Modal').default

    props:
      'displayUploadHint':
        type: Boolean
        default: '上传相片'
</script>


<style lang="less" scoped>
  .ImageEditor{
  }
</style>