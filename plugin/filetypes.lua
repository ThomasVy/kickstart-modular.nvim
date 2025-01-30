vim.filetype.add({
  extension = {
    pipeline = 'groovy'
  }, filename = {
    ['JenkinsFile'] = 'groovy',
    ['Jenkinsfile'] = 'groovy'
  }
})

