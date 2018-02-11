<template lang="jade">
  input.Input(
    :value="value",
    :type="type",
    :placeholder="placeholder",
    :autofocus="autofocus",
    :disabled="disabled",
    spellcheck="false",
    @input="input"
  )
</template>


<script lang="coffee">
  module.exports =
    props:
      'value':
        type: null
        default: ''
      'type':
        type: String
        default: 'text'
      'placeholder':
        type: String
        default: ''
      'autofocus':
        type: Boolean
        default: false
      'disabled':
        type: Boolean
        default: false

    methods:
      input: (e) ->
        @$emit('input', e.target.value)
</script>


<style lang="less" scoped>
  .Input{
    display: block;
    box-sizing: border-box;
    width: 100%;
    padding: 14px 16px;
    font-size: 16px;
    font-weight: 600;
    color: #273340;
    &::placeholder{
      color: #A2AEBA;
    }
  }
</style>