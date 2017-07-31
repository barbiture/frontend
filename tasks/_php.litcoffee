
HTML
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.


ALIAS -> config_php

    module.exports = (gulp, run, paths) ->
      () ->
        gulp.src(paths.php.src_files)
        .pipe run.include()
        .pipe run.gulp.dest(paths.php.dist_dir)
        .pipe run.notify(message: 'php task complete')
        .pipe run.connect.reload()







    ####### OLD DATA ########
    # module.exports = (gulp, run, paths) ->
    #   () ->
    #     gulp.watch([paths.php.src_files],['_php'])
    #         .on('change', run.browserSync.reload)

    #     gulp.src(paths.php.src_files)
    #     .pipe run.plumber(errorHandler: (err) ->
    #         run.notify.onError('Error: <%= error.message %>') err
    #         @emit 'end'
    #         return
    #       )
    #     .pipe run.include()
    #     .pipe run.gulp.dest(paths.php.dist_dir)
    #     .pipe run.duration('building php')
    #     .pipe run.notify(message: 'php task complete')
    #     .pipe run.browserSync.stream()
    #     .pipe run.connect.reload()