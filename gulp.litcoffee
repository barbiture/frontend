
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
    appName = 'maxkotkov'
    app = './app/'+appName+'/src/'

    prod = '../barbiture.github.io/'+appName+'/' #app prod and sourse
    dev = './app/'+appName+'/dist/'
    base = dev
    bowerJs = ['']
    bowerLess = ['']
    bowerImg = ['']
    bowerSass = ['']
    bowerCss = ['']

    # bowerJs = [1,2,3]
    # console.log bowerJs
    paths =
        'app_root':
            'app_src':              app
        'html': # compile and minfy html
            'src_files':            app+'*.html'
            'watch_files':          app+'components/**/*.html'
            'dist_dir':             base
        'less': # compile and minfy less
            'src_files':            app+'assets/styles/**/*.less'
            'watch_files':          app+'components/**/*.less'
            'dist_dir':             base+'styles/'
            'bower':                ''+bowerLess # BOWER LESS
        'js': # COMPILE AND MINFY JS
            'src_files':            app+'assets/js/*.js'
            'watch_files':          app+'components/**/*.js'
            'dist_dir':             base+'js/'
            'bower':                ''+bowerJs # BOWER JS
        'img': # compile and minfy img
            'src_files':            app+'assets/img/*.*'
            'dist_dir':             base+'img/'
            'bower':                ''+bowerImg # BOWER Img
        'fonts':  # compile and minfy fonts
            'src_files':            app+'assets/fonts/*.*'
            'dist_dir':             base+'fonts/'
        'jade':  # compile and minfy jade
            'src_files':            app+'views/*.jade'
            'dist_dir':             base+''
        'sass': # compile and minfy sass
            'src_files':            app+'assets/styles/**/*.scss'
            'dist_dir':             base+'styles/'
            'bower':                ''+bowerSass # BOWER Img
        'css': # compile and minfy css
            'src_files':            app+'assets/styles/*.css'
            'dist_dir':             base+'styles/'
            'bower':                ''+bowerCss # BOWER Img
        'coffee': # compile and minfy coffee
            'src_files':            app+'assets/js/*.litcoffee'
            'dist_dir':             base+'js/'
        'svgicons': # colores svg icons to sprte
                    # todo: testing colored files (use svgForEverybody.js)
            'src_colorless_files':  app+'assets/sprites/colorless/src/*.svg'
            'dist_colorless':       app+'assets/sprites/colorless/dist/'

            'src_colored_files':    app+'assets/sprites/colored/src/*.svg'
            'dist_colored':         app+'assets/sprites/colored/dist/'

            'dist_dir':             base+'sprites/'

        'raster': ## svg to png
            'src_files':            app+'assets/sprites/colorless/src/*.svg'
            'dist_dir':             app+'assets/sprites/png/dist'
        'pngicons': ## png sprite
            'src_files':            app+'assets/sprites/png/dist/*.png'
            'dist_styles':          app+'assets/sprites/png/src/'
            'dist_dir':             base+'sprites/'

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