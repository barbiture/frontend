
Scripts
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
        configSvg = 
          dest: './'
          log: 'info'
          mode: symbol:
            dest: 'symbol'
            sprite: 'sprite.svg'
            common: 'icons'
            render: scss:
              template: 'template/_symbol.scss'
              dest: '_symbol.scss'
            example: false
        () ->
          gulp.src paths.svgicons.src_colorless_files
          .pipe run.cheerio
            run: ($) ->
              $('[fill]').removeAttr('fill');
              $('[stroke]').removeAttr('stroke');
              $('[style]').removeAttr('style');
              return
            parserOptions: xmlMode: true

          # .pipe run.imagemin().pipe gulp.dest paths.svgicons.dist_dir
          # .pipe run.svgmin([{removeViewBox: true}]).pipe gulp.dest paths.svgicons.dist_dir
          .pipe run.replace '&gt;', '>'
          .pipe run.svgSprite(configSvg)
          .pipe gulp.dest paths.svgicons.dist_colorless_files
          .pipe run.duration('building svg icons')
          .pipe run.notify(message: 'svg icons task complete')
          .pipe run.browserSync.stream()
          .pipe run.connect.reload()
          .on 'end', () ->
            gulp.src paths.svgicons.dist_colorless_files+'symbol/*.svg'
            .pipe gulp.dest paths.svgicons.dist_dir
