
IMAGES
----------------------------------------------------------------
Optimize PNG, JPEG, GIF, SVG images within this single Gulp task.


    module.exports = (gulp, run, paths, base) ->
      () ->
        gulp.src paths.img.src_files
        # .pipe run.image()
        .pipe run.notify('Run: <%= file.relative %>')
        .pipe gulp.dest paths.img.dist_dir
        .pipe run.notify('Finished: <%= file.relative %>')
        .pipe run.browserSync.stream()
        .pipe run.connect.reload()