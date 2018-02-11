<template lang="jade">
  Modal.SelectModal(:open="open", :alpha="0" hide-close)
    .wrap
      .list
        .weather(@click="select('sun')")
          .icon-weather.sun
          .text 晴
        .weather(@click="select('cloud')")
          .icon-weather.cloud
          .text 多云 / 阴
        .weather(@click="select('rain')")
          .icon-weather.rain
          .text 雨
        .weather(@click="select('rain-thunder')")
          .icon-weather.rain-thunder
          .text 雷雨
        .weather(@click="select('rain-heavy')")
          .icon-weather.rain-heavy
          .text 暴雨
        .weather(@click="select('snow')")
          .icon-weather.snow
          .text 雪
        .weather(@click="select('snow-heavy')")
          .icon-weather.snow-heavy
          .text 暴雪
        .weather(@click="select('fog')")
          .icon-weather.fog
          .text 雾
      .nil
        .text(@click="select('')") 不去记录天气
</template>


<script lang="coffee">
  module.exports =
    components:
      'Modal': require('components/Modal').default

    props:
      'open':
        type: Boolean
        default: false

    methods:
      select: (weather) ->
        @commit('create-memory-modal/SET_WEATHER', weather)
        @$emit('close')
</script>


<style lang="less" scoped>
  .SelectModal{
    .wrap{
      width: 100%;
      padding: 36px 0 36px;
      background-color: rgba(0, 0, 0, 1);
      .list{
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        .weather{
          display: flex;
          flex-direction: column;
          align-items: center;
          padding: 0 24px;
          color: rgba(255, 255, 255, 0.4);
          cursor: pointer;
          transition: all 0.2s ease;
          .icon-weather{
            font-size: 96px;
            color: inherit;
          }
          .text{
            margin-top: 6px;
            font-size: 18px;
            font-weight: 600;
            color: inherit;
          }
        }
        .weather:hover{
          color: rgba(255, 255, 255, 1);
        }
      }
      .nil{
        margin-top: 60px;
        width: 100%;
        text-align: center;
        .text{
          display: inline-block;
          font-size: 17px;
          font-weight: 600;
          color: rgba(255, 255, 255, 0.4);
          cursor: pointer;
          transition: all 0.2s ease;
        }
        .text:hover{
          color: rgba(255, 255, 255, 1);
        }
      }
    }
  }
</style>