<template lang="jade">
  .Weather
    .input(@click="open=true")
      .icon-weather(v-show="weather", :class="weather")
      .icon-weather(v-show="!weather" class="nil")

    SelectModal(:open="open" @select="select")
</template>


<script lang="coffee">
  module.exports =
    components:
      'Input':       require('components/Input').default
      'SelectModal': require('./SelectModal').default

    model:
      prop: 'weather'
      event: 'select'

    props:
      'weather':
        type: String
        required: true

    data: ->
      open: false

    methods:
      select: (weather) ->
        @open = false
        @$emit('select', weather)
</script>


<style lang="less" scoped>
  .Weather{
    margin-left: 16px;
    align-self: stretch;
    .input{
      box-sizing: border-box;
      width: 56px;
      height: 100%;
      background-color: rgb(252, 252, 252);
      border: 1px solid rgb(209, 213, 218);
      border-radius: 3px;
      cursor: pointer;
      display: flex;
      justify-content: center;
      align-items: center;
      .icon-weather{
        font-size: 30px;
        color: #273340;
        &.nil{
          color: lighten(#A2AEBA, 10%);
        }
      }
    }
  }
</style>