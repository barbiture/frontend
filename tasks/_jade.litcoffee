
Scripts
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, base, app) ->
        () ->
          gulp.src app+'/views/*.jade'
          .pipe run.jade bare : true
          .pipe gulp.dest base
          .pipe run.browserSync.stream()
          .pipe run.connect.reload()