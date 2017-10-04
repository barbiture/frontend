
PNG SPRITE
----------------------------------------------------------------
Everything related to compiling CoffeeScript files, minifying
JavaScript files is handled within this single Gulp task.

    module.exports = (gulp, run, paths) ->
      () ->
        spriteData = gulp.src paths.pngicons.src_files
        .pipe run.spritesmith
          imgName: 'sprite.png'
          cssName: '_sprite.scss'
          cssFormat: 'scss'
          algorithm: 'binary-tree'
          cssTemplate: 'node_modules/spritesheet-templates/lib/templates/scss.template.handlebars'
          imgPath: '../sprites/sprite.png'
          cssVarMap: (sprite) ->
            sprite.name = 's-' + sprite.name
            return
        spriteData.img.pipe gulp.dest paths.pngicons.dist_dir  ## путь, куда сохраняем картинку
        spriteData.css.pipe gulp.dest paths.pngicons.dist_styles ##куда сохраняем стили
