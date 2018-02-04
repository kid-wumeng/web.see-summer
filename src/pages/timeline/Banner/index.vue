<template lang="jade">
  .Banner
    #particles-js
    .wrap
      .slogan 你的时光胶囊
      .slogan-desc 如果每天只拍一张相片，你会留住哪个瞬间？
      CreateButton
</template>


<script lang="coffee">

  require('particles.js')

  module.exports =
    components:
      'CreateButton': require('./CreateButton').default

    mounted: ->
      $(@$el).height($(window).height())

      particlesJS.load 'particles-js', '/static/particles.json', ->
        console.log('callback - particles.js config loaded');
</script>


<style lang="less" scoped>
  .Banner{
    width: 100%;
    background-image: url(~images/bg.jpg);
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    .wrap{
      position: absolute;
      text-align: center;
      pointer-events: none;
      .slogan{
        font-size: 56px;
        font-weight: 600;
      }
      .slogan-desc{
        margin-top: 26px;
        font-size: 26px;
        font-weight: 600;
      }
    }
    #particles-js{
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
    }
  }
</style>