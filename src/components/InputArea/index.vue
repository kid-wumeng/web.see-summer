<template lang="jade">
  textarea.InputArea(
    :value="value",
    :type="type",
    :placeholder="placeholder",
    :autofocus="autofocus",
    :rows="rows",
    :disabled="disabled",
    spellcheck="false",
    @input="input"
  )
</template>


<script lang="coffee">
  module.exports =
    props:
      'value':
        type: String
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
      'rows':
        type: Number
        default: 3
      'disabled':
        type: Boolean
        default: false

    methods:
      input: (e) ->
        @$emit('input', e.target.value)
</script>


<style lang="less" scoped>
  .InputArea{
    display: block;
    box-sizing: border-box;
    width: 100%;
    padding: 12px 16px;
    line-height: 26px;
    text-align: justify;
    font-size: 16px;
    font-weight: 600;
    color: #273340;
    resize: none;
    &::placeholder{
      color: #A2AEBA;
    }
  }
</style>