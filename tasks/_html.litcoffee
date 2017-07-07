
HTML
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.
    
    module.exports = (gulp, run, paths) ->
      () ->
        gulp.watch([
            paths.html.src_files,
            paths.html.src_files_components
            ],
            ['_html']
            )
            .on('change', run.browserSync.reload)
        gulp.src(paths.html.src_files)
        .pipe run.include()
        .pipe run.gulp.dest(paths.html.dist_dir)
        .pipe run.duration('building html')
        .pipe run.notify(message: 'html task complete')
        .pipe run.browserSync.stream()
        .pipe run.connect.reload()