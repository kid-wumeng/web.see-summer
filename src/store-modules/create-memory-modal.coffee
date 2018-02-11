module.exports =

  state:
    open:     true
    content:  ''
    location: ''
    weather:  ''

  mutations:
    'create-memory-modal/SHOW': (state) ->
      state.open = true

    'create-memory-modal/HIDE': (state) ->
      state.open     = false
      state.content  = ''
      state.location = ''
      state.weather  = ''

    'create-memory-modal/SET_CONTENT': (state, content) ->
      state.content  = content

    'create-memory-modal/SET_LOCATION': (state, location) ->
      state.location = location

    'create-memory-modal/SET_WEATHER': (state, weather) ->
      state.weather  = weather