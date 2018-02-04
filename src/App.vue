<template lang="jade">
  #app
    keep-alive
      router-view(v-if="$route.meta.keepAlive && auth", :key="key")
    router-view(v-if="!$route.meta.keepAlive && auth")
</template>


<script lang="coffee">
  module.exports =

    metaInfo: ->
      titleTemplate: (title) ->
        if title
          return "#{title} - 时之形"
        else
          return "时之形"

    computed:
      key: ->
        prefix = @$route?.meta?.key?.prefix ? ''
        params = @$route?.meta?.key?.params ? []
        query  = @$route?.meta?.key?.query  ? []
        hash   = @$route?.hash

        params = params.map (name) => @$route.params?[name] ? ''
        query  = query.map  (name) => @$route.query?[name]  ? ''

        key = prefix + params.join('') + query.join('') + hash

        if key
          return key
        else
          return null

      auth: ->
        if(@$route.meta.admin is true)  then return @admin
        if(@$route.meta.login is true)  then return @login
        if(@$route.meta.login is false) then return !@login
        return true
</script>


<style lang="less">

  @import '~assets/@';

</style>