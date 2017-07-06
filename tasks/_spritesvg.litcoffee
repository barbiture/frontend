
Scripts
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
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
          .pipe run.svgSprite(
            'svg':
              'xmlDeclaration': false
              'doctypeDeclaration': false
              'dimensionAttributes': false
            'mode': 'symbol':
              'dest': ''
              'example': false
              'sprite': 'sprite.svg')
          .pipe gulp.dest paths.svgicons.dist_dir
          .pipe run.duration('building svg icons')
          .pipe run.notify(message: 'svg icons task complete')
          .pipe run.browserSync.stream()
          .pipe run.connect.reload()
