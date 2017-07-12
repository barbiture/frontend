
BOWER
----------------------------------------------------------------



    module.exports = (gulp, run, paths, base) ->
      () ->
        gulp.src(run.mainBowerFiles(), base: 'bower_components').pipe gulp.dest('components/bower')