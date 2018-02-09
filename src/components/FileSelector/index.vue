<template lang="jade">
  .FileSelector(@click="click")
    slot
    input(
      ref="input",
      type="file",
      accept="image/png, image/jpeg",
      :multiple="multiple"
      @change="change"
    )
</template>


<script lang="coffee">
  module.exports =
    props:
      'max':
        type: Number
        default: 10 * 1024 * 1024
      'multiple':
        type: Boolean
        default: false

    methods:
      click: ->
        @$refs.input.click()

      change: (event) ->
        try
          files = event.target.files
          @check(files)

          if(@multiple)
            @$emit('select', files)
          else
            @$emit('select', files[0])

        catch error
          console.log error
          # @notify('warn', error, 3000)

      check: (files) ->
        for file in files
          if file.size > @max
            throw "请选择小于#{@max/1024/1024}MB的图片"
</script>


<style lang="less" scoped>
  .FileSelector{
    display: inline-block;
    cursor: pointer;
    input{
      display: none;
    }
  }
</style>