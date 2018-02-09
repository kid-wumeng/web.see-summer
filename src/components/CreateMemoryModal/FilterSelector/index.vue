<template lang="jade">
  .FilterSelector(v-if="dataUrl")
    .list
      Card(
        :index="-1",
        :data-url="dataUrl"
        @click.native="$emit('select', -1)"
      )
      Card(
        v-for="(filter, i) in filters",
        :key="i",
        :index="i",
        :data-url="dataUrl"
        @click.native="$emit('select', i)"
      )
    .next
      .button(@click="$emit('next')") 下一步
</template>


<script lang="coffee">
  module.exports =
    components:
      'Card': require('./Card').default

    props:
      'rawDataUrl':
        type: String
        required: true

    data: ->
      dataUrl: ''

    created: ->
      @dataUrl = await @imageZoomOut(@rawDataUrl, 80, true)
</script>


<style lang="less" scoped>
  .FilterSelector{
    height: 100%;
    position: relative;
    .list{
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: scroll;
    }
    .next{
      position: absolute;
      height: 100%;
      top: 0;
      right: 0;
      display: flex;
      align-items: center;
      .button{
        box-sizing: border-box;
        padding: 6px 16px 5px;
        font-weight: 600;
        font-size: 14px;
        color: rgba(255, 255, 255, 0.6);
        border: 1px solid rgba(255, 255, 255, 0.4);
        border-radius: 50px;
        cursor: pointer;
        transition: all 0.2s linear;
        user-select: none;
        &:hover{
          color: rgba(255, 255, 255, 1);
          border: 1px solid rgba(255, 255, 255, 1);
        }
      }
    }
  }
</style>