<template lang="jade">
  .Location
    Input(:value="location" placeholder="拍摄地点 / 选填" @input="input")
    .helper
      .icon.location(@click="setLocationByApi")
</template>


<script lang="coffee">
  module.exports =
    components:
      'Input': require('components/Input').default

    data: ->
      locationByApi: ''

    computed:
      location: -> @state['create-memory-modal'].location

    mounted: ->
      @getLocationByApi()

    methods:
      getLocationByApi: ->
        $.ajax({
          url: 'http://api.map.baidu.com/location/ip?ak=kNkpYBkdWKIkONKzG8oHTro0YuTG2rqm'
          dataType: 'jsonp'
          success: (data) =>
            if(data.status is 0)
              @locationByApi = data.content.address
        })

      setLocationByApi: ->
        @commit('create-memory-modal/SET_LOCATION', @locationByApi)

      input: (location) ->
        @commit('create-memory-modal/SET_LOCATION', location)
</script>


<style lang="less" scoped>
  .Location{
    flex: auto;
    position: relative;
    .Input{
      box-sizing: border-box;
      padding-right: 52px;
      background-color: rgb(252, 252, 252);
      border: 1px solid rgb(209, 213, 218);
      border-radius: 3px;
      box-shadow: inset 0 1px 2px rgba(27, 31, 35, 0.075);
    }
    .helper{
      position: absolute;
      top: 0;
      right: 0;
      height: 100%;
      display: flex;
      align-items: center;
      .icon.location{
        margin-right: 16px;
        width: 20px;
        height: 20px;
        cursor: pointer;
        opacity: 0.4;
        transition: opacity 0.3s linear;
        &:hover{
          opacity: 1;
        }
      }
    }
  }
</style>