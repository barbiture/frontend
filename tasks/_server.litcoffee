
CONNECT
----------------------------------------------------------------

    module.exports = (gulp, run, paths, base) ->
      () ->
        run.connect.server
          root: base
          port: 8080
          livereload: on