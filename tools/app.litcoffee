
    # readline      = require('readline')  
    # console.log readline #todo: https://stackoverflow.com/questions/32902250/how-to-change-node-js-variables-from-terminal
    fs      = require('fs')
    prompt  = require('prompt')
    ncp     = require('ncp').ncp
    # net     = require('net')

    distProj = 'app/'
    distTest = 'app/test/'
    dist = distProj

    appSource = 'template/util/appTemplate/'
    appDest = ''

    properties = [
      {
        name: 'appName'
        # validator: /^[a-zA-Z\s\-]+$/
        warning: 'App name must be only letters, spaces, or dashes'
      }
    ]

    onErr = (err) ->
      console.log err
      1
    prompt.start()
    prompt.get properties, (err, result) ->
      if err
        return onErr(err)
      # console.log 'Command-line input received:'
      # console.log ' AppName: ' + result.appName
      
      fs.mkdirSync dist + result.appName
      # fs.mkdirSync dist + result.appName + '/src/'
      appDest = dist + result.appName + '/'
      console.log 'app is done!'
      # console.log appDest
      ncp.limit = 16
      ncp appSource, appDest, (err) ->
        console.log appSource
        console.log appDest
        if err
          return console.error(err)
        console.log 'copy is done!'
        return
      return



      # fs.mkdirSync 'app/appTemplate/'
      # fs.mkdirSync 'app/appTemplate/src'
      # fs.mkdirSync 'app/appTemplate/src/views'
      # fs.mkdirSync 'app/appTemplate/src/components'
      # fs.mkdirSync 'app/appTemplate/src/components/header'
      # fs.mkdirSync 'app/appTemplate/src/components/footer'
      # fs.mkdirSync 'app/appTemplate/src/assets'
      # fs.mkdirSync 'app/appTemplate/src/assets/styles'
      # fs.mkdirSync 'app/appTemplate/src/assets/styles/variables'
      # fs.mkdirSync 'app/appTemplate/src/assets/styles/mixin'
      # fs.mkdirSync 'app/appTemplate/src/assets/js'
      # fs.mkdirSync 'app/appTemplate/src/assets/img'
      # fs.mkdirSync 'app/appTemplate/src/assets/icons'