<template lang="jade">
  .best
    row.card.-between
      .left
        text-area.content(text="停止所有的时钟，切断电话，\n给狗一块浓汁的骨头，让他别叫，\n黯哑了钢琴，随着低沉的鼓")
      .right
        .photo
</template>


<script lang="coffee">
  module.exports =
    data: -> {}
</script>


<style lang="less" scoped>
  .best{
    .card{
      width: 800px;
      height: 300px;
      background-color: #FFF;
      .photo{
        width: 300px;
        height: 300px;
        background-image: url(~images/test-best.jpg);
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
      }
    }
  }
</style>