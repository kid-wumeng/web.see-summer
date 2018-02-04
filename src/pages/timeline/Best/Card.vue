<template lang="jade">
  Row.Card.-between
    .left
      .area
        TextArea.desc.-auto(text="普京好沧桑")
      .author © Hans-Wolfgang
    .right
      .photo
</template>


<script lang="coffee">
  module.exports =
    data: -> {}
</script>


<style lang="less" scoped>
  .Card{
    width: 720px;
    height: 360px;
    background-color: #FFF;
    padding: 20px;
    margin-bottom: 72px;
    .left{
      flex: auto;
      align-self: stretch;
      box-sizing: border-box;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      align-items: center;
      .area{
        flex: auto;
        display: flex;
        justify-content: center;
        align-items: center;
        box-sizing: border-box;
        padding: 60px;
        .desc{
          line-height: 30px;
          text-align: center;
          font-size: 16px;
          font-weight: 600;
          color: #262626;
        }
      }
      .author{
        margin-bottom: 16px;
        font-size: 12px;
        color: #A2AEBA;
      }
    }
    .right{
      .photo{
        width: 360px;
        height: 360px;
        background-image: url(~images/test-best.jpg);
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
      }
    }
  }
</style>