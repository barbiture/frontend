
GULP-CLEAN
----------------------------------------------------------------
app dist remove


    module.exports = (gulp, run, paths) ->
      () ->
        gulp.src [paths.base.base_style, paths.base.base_js, paths.base.base_img, paths.base.base_fonts, paths.base.base_audio], {read: false}
        .pipe run.clean()
        .pipe run.notify('Finished: <%= file.relative %>')





