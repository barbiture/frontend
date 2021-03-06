
JavaScript CoffeeScript
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
      () ->
        gulp.src paths.js.src_files
        .pipe run.sourcemaps.init()
        # .pipe run.concat 'app.js'
        .pipe run.include()
        .pipe run.plumber(errorHandler: (err) ->
            run.notify.onError('Error: <%= error.message %>') err
            @emit 'end'
            return
          )
        .pipe run.uglify()
        .pipe run.sourcemaps.write('./maps')
        .pipe gulp.dest paths.js.dist_dir
        .pipe run.duration('building js')
        .pipe run.notify('Finished: <%= file.relative %>')
        .pipe run.connect.reload()
