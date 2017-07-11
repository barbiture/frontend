
HTML
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.


ALIAS -> config_html

    module.exports = (gulp, run, paths) ->
      () ->
        gulp.src(paths.html.src_files)
        .pipe run.include()
        .pipe run.gulp.dest(paths.html.dist_dir)
        .pipe run.notify(message: 'html task complete')
        .pipe run.connect.reload()







    ####### OLD DATA ########
    # module.exports = (gulp, run, paths) ->
    #   () ->
    #     gulp.watch([paths.html.src_files],['_html'])
    #         .on('change', run.browserSync.reload)

    #     gulp.src(paths.html.src_files)
    #     .pipe run.plumber(errorHandler: (err) ->
    #         run.notify.onError('Error: <%= error.message %>') err
    #         @emit 'end'
    #         return
    #       )
    #     .pipe run.include()
    #     .pipe run.gulp.dest(paths.html.dist_dir)
    #     .pipe run.duration('building html')
    #     .pipe run.notify(message: 'html task complete')
    #     .pipe run.browserSync.stream()
    #     .pipe run.connect.reload()