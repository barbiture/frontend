
JavaScript CoffeeScript
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
      () ->
        gulp.src [
          paths.js.src_files
          'bower_components/svg4everybody/dist/svg4everybody.js'
        ]
        .pipe run.sourcemaps.init()
        # .pipe run.concat 'app.js'
        .pipe run.uglify()
        .pipe run.sourcemaps.write('./maps')
        .pipe gulp.dest paths.js.dist_dir
        .pipe run.duration('building js')
        .pipe run.notify(message: 'js task complete')
        .pipe run.browserSync.stream()
        .pipe run.connect.reload()