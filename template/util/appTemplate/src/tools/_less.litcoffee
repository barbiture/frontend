
    fs      = require('fs')
    ncp     = require('ncp').ncp
    del     = require('del')
    appSource = 'components/util/less'
    appDest = 'assets/styles'
    del ['assets/styles/*.scss', 'assets/styles/src/*.scss', 'assets/styles/src/_base/'], ->
    ncp.limit = 16
    ncp appSource, appDest, (err) ->
      console.log appSource
      console.log appDest
      if err
        return console.error(err)
      console.log 'copy is done!'
      return
    return