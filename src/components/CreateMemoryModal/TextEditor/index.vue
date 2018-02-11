<template lang="jade">
  Row.TextEditor
    .left
      .image
    Column.right
      Content(v-model="content")
      Row
        Location(v-model="location" @use-location-helper="useLocationHelper")
        Weather(v-model="weather" @select="selectWeather")
</template>


<script lang="coffee">
  module.exports =
    components:
      'Content':  require('./Content').default
      'Location': require('./Location').default
      'Weather':  require('./Weather').default

    props:
      'rawDataUrl':
        type: String
        required: false

    data: ->
      content: ''
      location: ''
      locationHelper: ''
      weather: ''

    mounted: ->
      $.ajax({
        url: 'http://api.map.baidu.com/location/ip?ak=kNkpYBkdWKIkONKzG8oHTro0YuTG2rqm'
        dataType: 'jsonp'
        success: (data) =>
          if(data.status is 0)
            @locationHelper = data.content.address
      })

    methods:
      useLocationHelper: ->
        if(@locationHelper)
          @location = @locationHelper

      selectWeather: (weather) ->
        @weather = weather
</script>


<style lang="less" scoped>

  .TextEditor{
    .left{
      width: 400px;
      height: 400px;
      .image{
        width: 100%;
        height: 100%;
        background-image: url(~images/test-best.jpg);
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
      }
    }
    .right{
      box-sizing: border-box;
      width: 400px;
      height: 400px;
      padding: 16px;
      background-color: #FFF;
    }
  }
</style>