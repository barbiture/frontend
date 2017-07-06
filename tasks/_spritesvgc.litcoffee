
Scripts
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
        () ->
          gulp.src paths.svgicons.src_colored_files
          .pipe run.svgSprite(
            'svg':
              'xmlDeclaration': false
              'doctypeDeclaration': false
              'dimensionAttributes': false
            'mode': 'symbol':
              'dest': ''
              'example': false
              'sprite': 'spritec.svg')
          .pipe gulp.dest paths.svgicons.dist_dir
          .pipe run.duration('building svg icons')
          .pipe run.notify(message: 'svg icons task complete')
          .pipe run.browserSync.stream()
          .pipe run.connect.reload()
