exports.includes = (array=[], value) ->
  for item in array
    if item is value
      return true
  return false


exports.api = (path) ->
  console.log 222


exports.cdn = (path) ->
  console.log 333


exports.trim = (string) ->
  return string.replace(/^\s+|\s+$/g, '')