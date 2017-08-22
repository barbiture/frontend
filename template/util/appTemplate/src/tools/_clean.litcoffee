
    fs      = require('fs')
    prompt  = require('prompt')
    fs.unlinkSync

    properties = [
      {
        name: 'pageName'
        validator: /^[a-zA-Z\s\-]+$/
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
      console.log ' PageName: ' + result.pageName
      filepath = result.pageName+'.html'

      fs.unlinkSync filepath, (err) ->
        if err
          throw err
        console.log 'The file was succesfully removed!'
        return


      fs.writeFile 'components/util/links/links.html', '', (err) ->
        if err
          throw err
        console.log 'The file was succesfully saved!'
      return