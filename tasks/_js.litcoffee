
JavaScript CoffeeScript
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
      () ->
        gulp.watch(
            [
              paths.js.src_files,
              paths.app_root.app_src+'components/**/*.js'
            ],
            ['_js']
            )
            .on('change', run.browserSync.reload)
        gulp.src [
          paths.js.src_files
          'bower_components/bootstrap/js/dropdown.js'
        ]
        .pipe run.sourcemaps.init()
        # .pipe run.concat 'app.js'
        .pipe run.uglify()
        .pipe run.sourcemaps.write('./maps')
        .pipe gulp.dest paths.js.dist_dir
        .pipe run.duration('building js')
        .pipe run.notify(message: 'js task complete')
        .pipe run.livereload()
        .pipe run.connect.reload()
