
MERGE LESS SASS CSS
----------------------------------------------------------------
Everything related to compiling styles files, minifying
styles files, autoprefixer, plumber error and sourcemaps is handled
within this single Gulp task.

    merge = require('merge-stream')

    module.exports = (gulp, run, paths) ->
      () ->
        lessStream = gulp.src paths.less.src_files
          .pipe run.less()
          .pipe run.concat('less-files.less')
        scssStream = gulp.src paths.sass.src_files
          .pipe run.sass()
          .pipe run.concat('scss-files.scss')
        cssStream = gulp.src paths.css.src_files
          .pipe run.concat('css-files.css')
        mergedStream = merge(lessStream, scssStream, cssStream)
          .pipe run.sourcemaps.init()
          .pipe run.plumber(errorHandler: (err) ->
              run.notify.onError('Error: <%= error.message %>') err
              @emit 'end'
              return
            )
          .pipe run.autoprefixer
            browsers: [
              'last 2 versions'
              'ie 9'
            ]
            cascade: false
          .pipe run.plumber(errorHandler: (err) ->
              run.notify.onError('Error: <%= error.message %>') err
              @emit 'end'
              return
            )
          .pipe run.concat('styles.css')
          .pipe gulp.dest paths.less.dist_dir
        mergedStream
