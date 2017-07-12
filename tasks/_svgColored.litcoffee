
SVG SPRITE
----------------------------------------------------------------
Everything related to compiling colored svg files, minifying
svg files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
        confColored =
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
            dest: './'
            sprite: 'colored.svg'
            common: 'icons'
            render: less:
              template: 'template/sprite/_symbol.less'
              dest: 'sprite.less'
            example:
              template: 'template/sprite/_symbol.html'
              dest: 'sprite.colored.html'
        () ->
          gulp.src paths.svgicons.src_colored_files
          .pipe run.plumber(errorHandler: (err) ->
              run.notify.onError('Error: <%= error.message %>') err
              @emit 'end'
              return
            )
          .pipe run.svgSprite(confColored)
          .pipe gulp.dest paths.svgicons.dist_colored
          .pipe run.duration('building svg icons')
          .pipe run.notify('Finished: <%= file.relative %>')
          .pipe run.connect.reload()
          .on 'end', () ->
            gulp.src paths.svgicons.dist_colored+'*.svg'
            .pipe gulp.dest paths.svgicons.dist_dir
