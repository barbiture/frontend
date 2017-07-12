
MODULARIZED TASK LOADER
----------------------------------------------------------------
This handles modularizing all of our Gulp tasks in a very easy
and understandable manner. To ease plugin loading, we require 
'gulp-load-plugins' so dependencies from `package.json` get
autoloaded. It's just called `run` for expressiveness.
projects in ./app/: 
    blagoyArt
test projects in ./app/: 
    test/htmlTest
    test/spriteTest



    gulp = require 'gulp'
    run  = require('gulp-load-plugins')(pattern: '*')
    appName = 'test/spriteTest'
    app = './app/'+appName+'/src/'

    prod = '../barbiture.github.io/'+appName+'/' #app prod and sourse
    dev = './app/'+appName+'/dist/'
    base = dev
    paths =
        'app_root':
            'app_src': app
        'html':
            'src_files': app+'*.html'
            'watch_files': app+'components/**/*.html'
            'dist_dir': base
        'less':
            'src_files': app+'assets/styles/**/*.less'
            'watch_files': app+'components/**/*.less'
            'dist_dir': base+'styles/'
        'img':
            'src_files': app+'assets/img/*.*'
            'dist_dir': base+'img/'
        'fonts':
            'src_files': app+'assets/fonts/*.*'
            'dist_dir': base+'fonts/'
        'jade':
            'src_files': app+'views/*.jade'
            'dist_dir': base+''
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
            'dist_colorless': app+'assets/icons/colorless/dest/'

            'src_colored_files': app+'assets/icons/colored/src/*.svg'
            'dist_colored': app+'assets/icons/colored/dest/'

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

    run.util.log '##### GULP BUILD #####'
    yellow  = run.util.colors.yellow app
    blue    = run.util.colors.blue 'starting project at'
    run.util.log "#{blue}"
    run.util.log "#{yellow}"
    run.util.log ''

    module.exports = (tasks) ->
      addElem: (paths) ->
      tasks.forEach (name) ->
        gulp.task name, require("./tasks/#{name}")(gulp, run, paths, base)

      return gulp