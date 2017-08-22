
MODULARIZED TASK LOADER
----------------------------------------------------------------
This handles modularizing all of our Gulp tasks in a very easy
and understandable manner. To ease plugin loading, we require 
'gulp-load-plugins' so dependencies from `package.json` get
autoloaded. It's just called `run` for expressiveness.
projects in ./app/:
    blagoyArt
    maxkotkov
    lublu-no_Roma
test projects in ./app/:
    test/htmlTest
    test/spriteTest



    gulp = require 'gulp'
    run  = require('gulp-load-plugins')(pattern: '*')
    appName = 'deltaplan'
    app = './app/'+appName+'/src/'

    prod = '../barbiture.github.io/'+appName+'/' #app prod and sourse
    dev = './app/'+appName+'/dist/'
    base = dev

!todo: make js bower / css bower / sass bower 
    
    bsassSrc = [
        # 'bower_components/bootstrap/scss/bootstrap-grid.scss'
    ]
    bJsSrc = [
            #'bower_components/jquery/dist/jquery.min.js'
        # -> FANCYBOX
        # TODO: ADD TO ./COMPONENTS FANCY QUICK START
            # 'bower_components/bower_components/fancybox/dist/jquery.fancybox.min.js'

        # -> JQUERY UI "DATE PICKER" "RANGE SLIDER"
        # !TODO: CLEAN CORE.JS / EFFECT.JS
            # 'bower_components/jquery-ui/ui/core.js'
            # 'bower_components/jquery-ui/ui/effect.js'

            # 'bower_components/jquery-ui/ui/widgets/datepicker.js'
            # 'bower_components/jquery-ui/ui/widgets/mouse.js'
            # 'bower_components/jquery-ui/ui/widgets/slider.js'
        # -> END JQUERY UI "DATE PICKER" "RANGE SLIDER"

        # -> STAR RATING PLUG
            # 'bower_components/jquery-star-rating/jquery.form.js'
        # !TODO: TEST STAR RATING PLUG

        # -> JQUERY.FORM-STYLER
            # 'bower_components/jquery.form-styler/dist/jquery.formstyler.min.js'

        # -> CUSTOM-SCROLLBAR
            # 'bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js'
        # !TODO: TEST

        # -> OWL.CAROUSEL
            'bower_components/owl.carousel/dist/owl.carousel.min.js'
            # 'bower_components/slick-carousel/slick/slick.min.js'
            # 'bower_components/wow/dist/wow.min.js'


        # -> JQUERY.INPUTMASK
            # 'bower_components/inputmask/dist/min/jquery.inputmask.bundle.min.js'
        # !TODO: TEST ./COMPONENTS/COMPONENTS/INPUTMASK/_ONFOCUS.JS
                    # ./components/components/inputmask/_onHover.js
    ]
    bCssSrc = [

            'bower_components/owl.carousel/dist/assets/owl.carousel.min.css'
        # !TODO: Разобраться куда ложить и где менять иконку loader используемых плалгинов
        # 'bower_components/owl.carousel/dist/assets/ajax-loader.gif'

        # -> BOOTSTRAP 4
            'bower_components/bootstrap/dist/css/bootstrap-grid.min.css'
        # -> FONT-AWSEOME
            'bower_components/font-awesome/css/font-awesome.min.css'

    ]
    bFntSrc = [
        # -> FONT-AWSEOME
            'bower_components/font-awesome/fonts/*.*'

    ]
    jsSrc = [app+'assets/js/*.js']
    jsWatch = [ app+'assets/js/*.js', app+'components/**/*.js' ]
    lessSrc = [ app+'assets/styles/*.less' ]
    sassSrc = [ app+'assets/styles/*.scss' ]
    bowerImg = ['']
    bowerSass = ['']
    imgSrc = [ app+'assets/img/**/*.*' ]
    cssSrc = [  app+'assets/styles/*.css'
                app+'bower_components/jquery-ui-datepicker-only/jquery-ui.css'
                app+'bower_components/slick-carousel/slick/slick.css'
                app+'bower_components/jquery.form-styler/dist/jquery.formstyler.css'
            ]

    watchLess = [app+'components/**/*.less', app+'assets/styles/**/*.less', app+'assets/styles/*.less']
    watchSass = [app+'components/**/*.scss', app+'assets/styles/**/*.scss', app+'assets/styles/*.scss']
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
            'src_files':            sassSrc
            'watch_files':          watchSass
            'dist_dir':             base+'css/'
            'bower':                bowerSass # BOWER Sass
        'js': # COMPILE AND MINFY JS
            'src_files':            jsSrc #app+'assets/js/custom.js'
            'watch_files':          jsWatch
            'dist_dir':             base+'js/'
        'bJs': # COMPILE AND MINFY JS
            'src_files':            bJsSrc
            'dist_dir':             base+'js/componetns'
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
            'dist_dir':             base+'css/'
        'bCss': # compile and minfy css
            'src_files':            bCssSrc
            'dist_dir':             base+'css/'
        'bFnt': # compile and minfy css
            'src_files':            bFntSrc
            'dist_dir':             base+'fonts/'
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
            'src_files':            app+'assets/styles/**/*.*'
            'dist_dir':             base+'sass/'

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