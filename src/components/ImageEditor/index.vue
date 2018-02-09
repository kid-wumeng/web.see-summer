<template lang="jade">
  .ImageEditor
    PreviewArea(
      ref="previewArea",
      :upload-hint="uploadHint"
      @sure-size="sureSize"
      @select-image="selectImage"
    )
    FilterArea(
      v-if="rawDataUrl",
      :size="size",
      :raw-data-url="rawDataUrl"
      @ready-filters="readyFilters"
      @select-filter="selectFilter"
    )
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
      size: 0
      rawDataUrl: ''

    methods:
      sureSize: (size) ->
        @size = size

      selectImage: (rawDataUrl) ->
        @rawDataUrl = rawDataUrl

      readyFilters: ->

      selectFilter: (i) ->
        @$refs['previewArea'].renderByFilter(i)
</script>


<style lang="less" scoped>
  .ImageEditor{
    overflow: scroll;
  }
</style>