
Scripts
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
        confColorless =
          dest: './'
          log: 'info'
          dimension:
            maxWidth: 32
            maxHeight: 32
          shape: spacing:
            box: 'padding'
            padding: 1
          mode: symbol:
            inline: true
            dest: 'dist/colorless'
            sprite: 'sprite.svg'
            common: 'icons'
            render: less:
              template: 'template/sprite/_symbol.less'
              dest: 'sprite.less'
            example:
              template: 'template/sprite/_symbol.html'
              dest: 'sprite.colorless.html'
        () ->
          gulp.src paths.svgicons.src_colorless_files
          .pipe run.plumber(errorHandler: (err) ->
              run.notify.onError('Error: <%= error.message %>') err
              @emit 'end'
              return
            )
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
          .pipe run.notify('Finished: <%= file.relative %>')
          .pipe run.browserSync.stream()
          .pipe run.connect.reload()
          .on 'end', () ->
            gulp.src paths.svgicons.dist_colorless_files+'symbol/*.svg'
            .pipe gulp.dest paths.svgicons.dist_dir
