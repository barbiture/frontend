
    fs      = require('fs')
    fs.writeFile 'components/util/links/links.html', '', (err) ->
      if err
        throw err
      console.log 'The file was succesfully saved!'
    return