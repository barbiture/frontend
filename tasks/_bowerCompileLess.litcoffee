
BOWER
----------------------------------------------------------------



    module.exports = (gulp, run, paths, base) ->
      () ->
        gulp.src('components/bower/bootstrap/less/bootstrap.less')
        .pipe run.less()
        .pipe gulp.dest('components/bower/bootstrap/dist/css')