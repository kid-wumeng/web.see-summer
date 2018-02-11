<template lang="jade">
  .Banner
    #particles-js
    .wrap
      .slogan(v-show="!creating") 你的时光胶囊
      .slogan-desc(v-show="!creating") 如果每天只拍一张相片，你会留住哪个瞬间？
      Create
    DropdownHint(v-show="!creating")
</template>


<script lang="coffee">

  require('particles.js')

  module.exports =
    components:
      'Create':       require('./Create').default
      'DropdownHint': require('components/DropdownHint').default

    computed:
      'creating': -> @state['create-memory-modal'].open

    mounted: ->
      $(@$el).height($(window).height())
      particlesJS.load('particles-js', '/static/particles.json')
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
    #particles-js{
      position: absolute;
      top: 0;
      left: 0;
      z-index: 1;
      width: 100%;
      height: 100%;
    }
    >.wrap{
      position: absolute;
      z-index: 2;
      margin-top: -16px;
      .slogan{
        text-align: center;
        font-size: 56px;
        font-weight: 600;
        user-select: none;
      }
      .slogan-desc{
        text-align: center;
        margin-top: 26px;
        font-size: 26px;
        font-weight: 600;
        user-select: none;
      }
    }
    .DropdownHint{
      position: absolute;
      bottom: 30px;
    }
  }
</style>