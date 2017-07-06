
FONTS
----------------------------------------------------------------
Copy Fonts within this single Gulp task.


    module.exports = (gulp, run, paths, base) ->
      () ->
        gulp.src paths.fonts.src_files
        .pipe run.plumber(errorHandler: (err) ->
            run.notify.onError('Error: <%= error.message %>') err
            @emit 'end'
            return
          )
        .pipe gulp.dest paths.fonts.dist_dir
        .pipe run.notify('Finished: <%= file.relative %>')
        .pipe run.browserSync.stream()
        .pipe run.connect.reload()