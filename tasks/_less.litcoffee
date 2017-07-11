
Less
----------------------------------------------------------------
Everything related to compiling Less files, minifying
Less files, autoprefixer, plumber error and sourcemaps is handled
within this single Gulp task.


    module.exports = (gulp, run, paths, base) ->
      () ->
        gulp.src paths.less.src_files
        .pipe run.sourcemaps.init()
        .pipe run.plumber(errorHandler: (err) ->
            run.notify.onError('Error: <%= error.message %>') err
            @emit 'end'
            return
          )
        .pipe run.less
          bare : true
          compress: true
        .pipe run.autoprefixer
          browsers: [
            'last 2 versions'
            'ie 9'
          ]
          cascade: false
        .pipe run.sourcemaps.write('./maps')
        .pipe gulp.dest paths.less.dist_dir
        .pipe run.notify('Finished: <%= file.relative %>')
        .pipe run.connect.reload()




