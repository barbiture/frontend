
Less
----------------------------------------------------------------
Everything related to compiling Less files, minifying
Less files, autoprefixer, plumber error and sourcemaps is handled
within this single Gulp task.


    module.exports = (gulp, run, paths) ->
      () ->
        gulp.src paths.css.src_files
        .pipe gulp.dest paths.css.dist_dir
        .pipe run.notify('Finished: <%= file.relative %>')
        .pipe run.browserSync.stream()
        .pipe run.connect.reload()




