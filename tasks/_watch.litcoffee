
    module.exports = (gulp, run, paths) ->

      () ->
        gulp.watch(paths.less.src_files, ['_less']).on('change', run.browserSync.reload);
        gulp.watch(paths.sass.src_files, ['_sass']).on('change', run.browserSync.reload);
        gulp.watch(paths.css.src_files, ['_css']).on('change', run.browserSync.reload);
        gulp.watch(paths.html.src_files, ['_html']).on('change', run.browserSync.reload);
        gulp.watch(paths.js.src_files, ['_js']).on('change', run.browserSync.reload);
        gulp.watch(paths.svgicons.src_colorless_files, ['_spritesvg']).on('change', run.browserSync.reload);
        gulp.watch(paths.svgicons.src_colored_files, ['_spritesvgc']).on('change', run.browserSync.reload);
        gulp.watch(paths.jade.src_files, ['_jade']).on('change', run.browserSync.reload);