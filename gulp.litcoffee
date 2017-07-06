
# Modularized Task Loader
----------------------------------------------------------------
This handles modularizing all of our Gulp tasks in a very easy
and understandable manner. To ease plugin loading, we require 
'gulp-load-plugins' so dependencies from `package.json` get
autoloaded. It's just called `run` for expressiveness.


$APP

    app = './projects/blagoyArt/src/'

    prod = '../barbiture.github.io/'
    dev = './projects/blagoyArt/dist/'
    base = dev
    paths =
        'html':
            'src_files': app+'*.html'
            'dist_dir': base+''
        'img':
            'src_files': app+'assets/img/*.*'
            'dist_dir': base+'img/'
        'fonts':
            'src_files': app+'assets/fonts/*.*'
            'dist_dir': base+'fonts/'
        'jade':
            'src_files': app+'views/*.jade'
            'dist_dir': base+''
        'less':
            'src_files': app+'assets/styles/**/*.less'
            'dist_dir': base+'styles/'
        'sass':
            'src_files': app+'assets/styles/**/*.scss'
            'dist_dir': base+'styles/'
        'css':
            'src_files': app+'assets/styles/*.css'
            'dist_dir': base+'styles/'
        'js':
            'src_files': app+'assets/js/*.js'
            'dist_dir': base+'js/'
        'coffee':
            'src_files': app+'assets/js/*.litcoffee'
            'dist_dir': base+'js/'
        'svgicons':
            'src_colorless_files': app+'assets/icons/colorless/*.svg'
            'src_colored_files': app+'assets/icons/colored/*.svg'
            'dist_dir': base+'icons/'
        'raster':
            'src_files': app+'assets/icons/**/*.svg'
            'dist_dir': app+'assets/icons/png'
        'pngicons':
            'src_files': app+'assets/icons/png/*.png'
            'dist_styles':  app+'assets/styles/variables/'
            'dist_dir': base+'icons/'
        'images':
            'src_files': app+'assets/img/*.*'
            'dist_dir': app+'images/'

    gulp = require 'gulp'
    run  = require('gulp-load-plugins')(pattern: '*')

    module.exports = (tasks) ->
      addElem: (paths) ->
      tasks.forEach (name) ->
        gulp.task name, require("./tasks/#{name}")(gulp, run, paths, base)

      return gulp