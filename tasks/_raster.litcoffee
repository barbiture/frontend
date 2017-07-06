
RASTER
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
        () ->
          gulp.src paths.raster.src_files
          .pipe run.raster()
          .pipe run.rename extname: '.png'
          .pipe run.gulp.dest paths.raster.dist_dir
          .pipe run.duration('building html')
          .pipe run.notify(message: 'svg2png task complete')
          .pipe run.browserSync.stream()
          .pipe run.connect.reload()