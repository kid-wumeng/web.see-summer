<template lang="jade">
  Modal.CreateMemoryModal(:open="state['create-memory-modal'].open" @close="commit('create-memory-modal/HIDE')")
    .wrap
      ImageEditor
</template>


<script lang="coffee">
  module.exports =
    components:
      'Modal':       require('components/Modal').default
      'ImageEditor': require('components/ImageEditor').default

    props:
      'open':
        type: Boolean
        default: false

    watch:
      'open': (open) ->
        if(open)
          $(document.body).css('overflow', 'hidden')
          $(document.body).css('height', '100%')
        else
          $(document.body).css('overflow', 'auto')
          $(document.body).css('height', 'auto')
</script>


<style lang="less" scoped>
  .CreateMemoryModal{
    .wrap{
    }
  }
</style>