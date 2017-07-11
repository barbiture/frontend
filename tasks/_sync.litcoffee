
BROWSERSYNC
-> IF DON'T LIKE CONNECT, USE THIS STAFF
----------------------------------------------------------------


    module.exports = (gulp, run, paths, base) ->
      browserSync = run.browserSync.create()
      browserSync.init
        server: baseDir: base
        host: 'localhost'
        port: 8080
        tunnel: false
        directory: true
        open: false
      return
      # gulp.watch([paths.html.src_files, paths.html.watch_files],['_html']).on('change', browserSync.reload)