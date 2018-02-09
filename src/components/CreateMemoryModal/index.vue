<template lang="jade">
  Modal.CreateMemoryModal(:open="state['create-memory-modal'].open" @close="commit('create-memory-modal/HIDE')")
    .main(ref="main")
      ImageSelector(
        v-if="step === 1"
        @select="selectImage"
      )
      ImageHandler(
        v-if="step === 2",
        ref="imageHandler",
        :raw-data-url="rawDataUrl"
      )
    .side
      FilterSelector(
        v-if="step === 2",
        :raw-data-url="rawDataUrl"
        @select="selectFilter"
        @next="step === 3"
      )
</template>


<script lang="coffee">
  module.exports =
    components:
      'Modal':          require('components/Modal').default
      'ImageSelector':  require('./ImageSelector').default
      'ImageHandler':   require('./ImageHandler').default
      'FilterSelector': require('./FilterSelector').default

    props:
      'open':
        type: Boolean
        default: false

    data: ->
      step: 1
      rawDataUrl: ''

    watch:
      'open': (open) ->
        if(open)
          $(document.body).css('overflow', 'hidden')
          $(document.body).css('height', '100%')
        else
          $(document.body).css('overflow', 'auto')
          $(document.body).css('height', 'auto')

    mounted: ->
      height = $(window).height()
      $(@$refs.main).height(height - 160)

    methods:
      selectImage: (rawDataUrl) ->
        @rawDataUrl = rawDataUrl
        @step = 2

      selectFilter: (i) ->
        @$refs.imageHandler.selectFilter(i)
</script>


<style lang="less" scoped>
  .CreateMemoryModal{
    display: flex;
    flex-direction: column;
    .main{
      flex: auto;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .side{
      flex: none;
      box-sizing: border-box;
      width: 100%;
      padding: 0 5%;
      height: 160px;
      background-color: rgba(0, 0, 0, 0.6);
    }
  }
</style>