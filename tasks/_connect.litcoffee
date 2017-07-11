
CONNECT
----------------------------------------------------------------

    module.exports = (gulp, run, paths, base) ->
      () ->
        run.connect.server
          root: base
          port: 3030
          livereload: on