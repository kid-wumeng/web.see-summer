window.Vue = require('vue').default
window.$   = require('webpack-zepto')



##################################################
## 开发环境标识
##################################################
window.dev = process.env.NODE_ENV is 'development'



##################################################
## PC/H5 环境标识
##################################################
if /seo-request/.test(location.href)
  # chrome-render转发的爬虫请求
  window.isPC = true
else
  if(document?.documentElement?.clientWidth > 1024)
    window.isPC = true
  else
    window.isH5 = true



##################################################
## 插件
##################################################
Vue.use(require('vue-meta'))
Vue.use(require('vue-lazyload'))

Vue.use({
  install: (Vue) ->
    window.includes = Vue.prototype.includes = require('./utils').includes
    window.api      = Vue.prototype.api      = require('./utils').api
    window.cdn      = Vue.prototype.cdn      = require('./utils').cdn
    window.trim     = Vue.prototype.trim      = require('./utils').trim
})



##################################################
## 全局组件
##################################################
Vue.component('row',       require('components/row').default)
Vue.component('column',    require('components/column').default)
Vue.component('text-area', require('components/text-area').default)


##################################################
## 路由
##################################################
Router = require('vue-router').default
Vue.use(Router)

if window.isPC
  routes = require('./routes')
else
  routes = require('./routes.h5')

router = new Router({
  mode: 'history'
  routes: routes
  scrollBehavior: (to, from, savedPosition) -> savedPosition ? {x: 0, y: 0}
})



##################################################
## APP
##################################################
if window.isH5
  App = require('./App.h5').default
else
  App = require('./App').default

new Vue({
  el: '#app'
  # store: store
  router: router
  render: (h) => h(App)
})



##################################################
## 为chrome-render设置的页面完成标识
##################################################
setTimeout (-> window.isPageReady = 1), 5000