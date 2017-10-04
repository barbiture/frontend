
Less
----------------------------------------------------------------
Everything related to compiling Less files, minifying
Less files, autoprefixer, plumber error and sourcemaps is handled
within this single Gulp task.


    module.exports = (gulp, run) ->
      () ->
        gulp.src(mainBowerFiles(), base: 'bower_components')
        .pipe gulp.dest('public/lib')
        .pipe run.notify('Finished: <%= file.relative %>')
        .pipe run.connect.reload()