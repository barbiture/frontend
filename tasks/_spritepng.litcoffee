
PNG SPRITE
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
      () ->
        spriteData = gulp.src paths.pngicons.src_files
        .pipe run.spritesmith
          imgName: 'sprite.png'
          cssName: 'sprite.less'
          cssFormat: 'less'
          algorithm: 'binary-tree'
          cssTemplate: 'template/sprite/less.template.mustache'
          imgPath: '../sprites/sprite.png'
          cssVarMap: (sprite) ->
            sprite.name = 's-' + sprite.name
            return
        spriteData.img.pipe gulp.dest paths.pngicons.dist_dir  ## путь, куда сохраняем картинку
        spriteData.css.pipe gulp.dest paths.pngicons.dist_styles ##куда сохраняем стили
