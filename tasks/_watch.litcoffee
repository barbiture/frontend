


    module.exports = (gulp, run, paths) ->
      () ->
        gulp.watch([paths.html.src_files, paths.html.watch_files], ['_html'])
        gulp.watch('components/bower/**/less/*.less', ['bowerLess'])
        gulp.watch([paths.less.src_files, paths.less.watch_files], ['_less'])
        # done()
    # #LESS
    #     gulp.watch(
    #         paths.less.src_files,
    #         ['_less'])
    #         .on('change', run.browserSync.reload)
    # #IMG
    # #FONTS
    #     gulp.watch(
    #         paths.fonts.src_files,
    #         ['_fonts'])
    #         .on('change', run.browserSync.reload)
    # #SASS
    # #CSS
    #     gulp.watch(
    #         paths.css.src_files,['_css'])
    #         .on('change', run.browserSync.reload)
    # #HTML

    # #JS

    # #SPRITESVG
    #     gulp.watch(
    #         paths.svgicons.src_colorless_files,
    #         ['_spritesvg'])
    #         .on('change', run.browserSync.reload)
    # #SPRITESVGC

    # #JADE
    #     gulp.watch(
    #         paths.jade.src_files,
    #         ['_jade'])
    #         .on('change', run.browserSync.reload)