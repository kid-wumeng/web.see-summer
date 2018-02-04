module.exports =

  state:
    open: true

  mutations:
    'create-memory-modal/SHOW': (state) ->
      state.open = true

    'create-memory-modal/HIDE': (state) ->
      state.open = false