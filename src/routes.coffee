module.exports = [{

  # TIME-LINE
  path: '/'
  meta:
    keepAlive: true
  component: -> System.import('pages/timeline')

},{

  # 滤镜库
  path: '/filters'
  component: -> System.import('pages/filters')

}]