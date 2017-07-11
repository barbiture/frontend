
BROWSERSYNC
-> IF DON'T LIKE CONNECT, USE THIS STAFF
----------------------------------------------------------------


    browserSync = require('browser-sync').create()
    module.exports = (gulp, run, paths, base) ->
      browserSync.init
        server: baseDir: base
        host: 'localhost'
        port: 8080
        tunnel: false
        directory: true
        open: false
      return