


    module.exports = (gulp, run, paths) ->
      () ->
        gulp.watch([paths.html.src_files, paths.html.watch_files], ['_html'])
        gulp.watch('components/bower/**/less/*.less', ['bowerLess'])
        gulp.watch(paths.less.watch_files, ['_less'])
        gulp.watch(paths.js.watch_files, ['_js'])
        gulp.watch([paths.sass.src_files, paths.sass.watch_files],['_sass'])
        gulp.watch(paths.css.src_files,['_css'])
        gulp.watch(paths.img.src_files,['_img'] )