
MODULARIZED TASK LOADER
----------------------------------------------------------------
This handles modularizing all of our Gulp tasks in a very easy
and understandable manner. To ease plugin loading, we require 
'gulp-load-plugins' so dependencies from `package.json` get
autoloaded. It's just called `run` for expressiveness.
projects in ./app/:
    blagoyArt
    maxkotkov
test projects in ./app/:
    test/htmlTest
    test/spriteTest



    gulp = require 'gulp'
    run  = require('gulp-load-plugins')(pattern: '*')
    appName = 'maxkotkov'
    app = './app/'+appName+'/src/'

    prod = '../barbiture.github.io/'+appName+'/' #app prod and sourse
    dev = './app/'+appName+'/dist/'
    base = prod
    jsSrc = [
              app+'assets/js/*.js'
              'bower_components/jquery/dist/jquery.min.js'
              'bower_components/smoothscroll-for-websites/SmoothScroll.js'
              'bower_components/fotorama/fotorama.js'
              'bower_components/ionsound/js/ion.sound.min.js'
              'bower_components/jQuery.dotdotdot/src/jquery.dotdotdot.min.js'
              'bower_components/fancybox/dist/jquery.fancybox.min.js'
              'bower_components/jquery.maskedinput/dist/jquery.maskedinput.min.js'
              'bower_components/jquery-placeholder-newlines/jquery.placeholder.min.js'
              'bower_components/jquery.form-styler/dist/jquery.formstyler.min.js'
              'bower_components/jquery-form/dist/jquery.form.min.js'
              'bower_components/jquery.form-styler/dist/jquery.formstyler.min.js'
              'bower_components/swiper/dist/js/swiper.jquery.min.js'
              # 'bower_components/jQuery.dotdotdot/src/jquery.dotdotdot.min.js'
            ]
    jsWatch = [
        app+'assets/js/*.js'
        app+'components/**/*.js'
    ]
    lessSrc = [
                app+'assets/styles/*.less'
    ]
    bowerImg = ['']
    bowerSass = ['']
    imgSrc = [
                    app+'assets/img/**/*.*'
                    'bower_components/fotorama/fotorama.png'
                    'bower_components/fotorama/fotorama@2x.png'
            ]
    cssSrc = [
                    app+'assets/styles/*.css'
                    'bower_components/gridly-flexbox/dist/gridly.min.css'
                    'bower_components/fotorama/fotorama.css'
                    'bower_components/jquery.form-styler/dist/jquery.formstyler.css'
                ]

    watchLess = [app+'components/**/*.less', app+'assets/styles/**/*.less', app+'assets/styles/*.less']
    # bowerJs = [1,2,3]
    # console.log bowerJs
    paths =
        'base':
            'base_style':           base+'styles/'
            'base_js':              base+'js/'
            'base_img':             base+'img/'
            'base_fonts':           base+'fonts/'
            'base_audio':           base+'audio/'
        'app_root':
            'app_src':              app
        'html': # compile and minfy html
            'src_files':            app+'*.html'
            'watch_files':          app+'components/**/*.html'
            'dist_dir':             base
        'less': # compile and minfy less
            'src_files':            lessSrc
            'watch_files':          watchLess
            'dist_dir':             base+'styles/'
        'sass': # compile and minfy sass
            'src_files':            app+'assets/styles/**/*.scss'
            'watch_files':          app+'components/**/*.scss'
            'dist_dir':             base+'styles/'
            'bower':                bowerSass # BOWER Img
        'js': # COMPILE AND MINFY JS
            'src_files':            jsSrc #app+'assets/js/*.js'
            'watch_files':          jsWatch
            'dist_dir':             base+'js/'
        'img': # compile and minfy img
            'src_files':            imgSrc
            'dist_dir':             base+'img/'
            'bower':                ''+bowerImg # BOWER Img
        'fonts':  # compile and minfy fonts
            'src_files':            app+'assets/fonts/*.*'
            'dist_dir':             base+'fonts/'
        'jade':  # compile and minfy jade
            'src_files':            app+'views/*.jade'
            'dist_dir':             base+''
        'css': # compile and minfy css
            'src_files':            cssSrc
            'dist_dir':             base+'styles/'
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
        'files': # compile and minfy css
            'src_files':            app+'assets/sounds/*.*'
            'dist_dir':             base+'sounds/'

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