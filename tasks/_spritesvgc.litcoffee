
Scripts
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
        configSvgSymbol = 
          dest: './'
          log: 'info'
          mode: symbol:
            dest: 'symbol'
            sprite: 'spritec.svg'
            common: 'icons'
            render: scss:
              template: 'template/_symbol.scss'
              dest: '_symbol.scss'
            example: false
        () ->
          gulp.watch(
              paths.svgicons.src_colored_files,
              ['_spritesvgc'])
              .on('change', run.browserSync.reload)

          gulp.src paths.svgicons.src_colored_files
          .pipe run.svgSprite(configSvgSymbol)
          .pipe gulp.dest paths.svgicons.dist_colored_files
          .pipe run.duration('building svg icons')
          .pipe run.notify(message: 'svg icons task complete')
          .pipe run.browserSync.stream()
          .pipe run.connect.reload()
          .on 'end', () ->
            gulp.src paths.svgicons.dist_colored_files+'symbol/*.svg'
            .pipe gulp.dest paths.svgicons.dist_dir
