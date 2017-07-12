
    fs      = require('fs')
    fs.writeFile 'components/util/links.html', '', (err) ->
      if err
        throw err
      console.log 'The file was succesfully saved!'
    return