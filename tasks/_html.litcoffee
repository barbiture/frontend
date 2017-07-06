
HTML
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.
    
    module.exports = (gulp, run, paths) ->
      () ->
        gulp.src(paths.html.src_files)
        .pipe run.gulp.dest(paths.html.dist_dir)
        .pipe run.duration('building html')
        .pipe run.notify(message: 'html task complete')
        .pipe run.browserSync.stream()
        .pipe run.connect.reload()