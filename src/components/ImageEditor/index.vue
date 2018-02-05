<template lang="jade">
  Row.ImageEditor
    PreviewArea(:upload-hint="uploadHint", :data-url="dataUrl" @select-image="selectImage")
    FilterArea(v-if="dataUrl")
</template>


<script lang="coffee">
  module.exports =
    components:
      'PreviewArea': require('./PreviewArea').default
      'FilterArea':  require('./FilterArea').default

    props:
      'uploadHint':
        type: String
        default: 'UPLOAD PHOTO'

    data: ->
      dataUrl: ''

    methods:
      selectImage: (dataUrl) ->
        @dataUrl = dataUrl
</script>


<style lang="less" scoped>
  .ImageEditor{
  }
</style>