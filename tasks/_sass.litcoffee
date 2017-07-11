
Sass
----------------------------------------------------------------
Everything related to compiling Sass files, minifying
Sass files, autoprefixer, plumber error and sourcemaps is handled
within this single Gulp task.


    module.exports = (gulp, run, paths) ->
      () ->

#WATCH
        console.log src_files_components
        gulp.watch([
              paths.sass.src_files
              paths.src_files_components+'*.scss'
            ],
            ['_sass']
            )
            .on('change', run.browserSync.reload)
#TASK
        gulp.src [
          paths.sass.src_files
          src_files_components+'*.scss'
          'bower_components/slick-carousel/slick/slick.scss'
          'bower_components/slick-carousel/slick/slick-theme.scss'
        ]
        .pipe run.sourcemaps.init()
        .pipe run.plumber(errorHandler: (err) ->
            run.notify.onError('Error: <%= error.message %>') err
            @emit 'end'
            return
          )
        .pipe run.sass
          bare : true
          compress: true
        .pipe run.autoprefixer
          browsers: [
            'last 2 versions'
            'ie 9'
          ]
          cascade: false
        .pipe run.sourcemaps.write('./maps')
        .pipe gulp.dest paths.sass.dist_dir
        .pipe run.notify('Finished: <%= file.relative %>')
        .pipe run.livereload()
        .pipe run.browserSync.stream()
        .pipe run.connect.reload()





