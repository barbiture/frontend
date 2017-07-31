

    fs      = require('fs')
    prompt  = require('prompt')
    cmd     = require('node-cmd')
    # cmd.get 'pwd', (err, data, stderr) ->
    #   console.log 'the current working dir is : ', data
    #   return

    fileContent = 'include'
    rootPage =  'components/util/links/links.html'
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
      link = '<li><a href="'+filepath+'">'+filepath+'</a></li>'
      fs.writeFile filepath, fileContent, (err) ->
        if err
          throw err
        console.log 'The file was succesfully saved!'
        return

      fs.appendFile rootPage, link, (err) ->
        if err
          throw err
        console.log 'The file was succesfully saved!'
        return

      cmd.run('subl '+result.pageName+'.html')

      return