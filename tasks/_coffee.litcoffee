
COFFEE
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
      () ->
        gulp.src(paths.coffee.src_files)
        .pipe run.sourcemaps.init()
        .pipe run.coffee bare : true
        .pipe run.uglify()
        .pipe run.sourcemaps.write('./maps')
        .pipe run.gulp.dest(paths.coffee.dist_dir)
        .pipe run.duration('building js')
        .pipe run.notify(message: 'js task complete')
        .pipe run.browserSync.stream()
        .pipe run.connect.reload()