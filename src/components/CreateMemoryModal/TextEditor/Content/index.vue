<template lang="jade">
  InputArea.Content(:value="content" placeholder="文字记录" @input="input")
</template>


<script lang="coffee">
  module.exports =
    components:
      'InputArea': require('components/InputArea').default

    model:
      prop: 'content'

    props:
      'content':
        type: String
        required: false

    methods:
      input: (content) ->
        @$emit('input', content)
</script>


<style lang="less" scoped>

  .TextEditor{
    .InputArea{
      flex: auto;
      margin-bottom: 16px;
      box-sizing: border-box;
      background-color: rgb(252, 252, 252);
      border: 1px solid rgb(209, 213, 218);
      border-radius: 3px;
      box-shadow: inset 0 1px 2px rgba(27, 31, 35, 0.075);
    }
  }
</style>