
Less
----------------------------------------------------------------
Everything related to compiling Less files, minifying
Less files, autoprefixer, plumber error and sourcemaps is handled
within this single Gulp task.


    module.exports = (gulp, run, paths) ->
      () ->
        gulp.src paths.files.src_files
        # .pipe run.file paths.files.src_files
        .pipe gulp.dest paths.files.dist_dir
        .pipe run.notify('Finished: <%= file.relative %>')



