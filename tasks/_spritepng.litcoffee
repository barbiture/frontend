
PNG SPRITE
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
      () ->
        spriteData = gulp.src paths.pngicons.src_files
        .pipe run.spritesmith
          imgName: 'sprite.png'
          cssName: '_sprite.less'
          cssFormat: 'less'
          algorithm: 'binary-tree'
          cssTemplate: 'template/_spritesmith.less'
          imgPath: '../icons/sprite.png'
          cssVarMap: (sprite) ->
            sprite.name = 's-' + sprite.name
            return
        spriteData.img.pipe gulp.dest paths.pngicons.dist_dir
        spriteData.css.pipe gulp.dest paths.pngicons.dist_styles
