vim.filetype.add({
  extension = {
    pipeline = 'groovy'
  }, filename = {
    ['JenkinsFile'] = 'groovy',
    ['Jenkinsfile'] = 'groovy'
  }
})

vim.filetype.add({
  extension = {
    pipeline = 'dockerfile'
  }, filename = {
    ['Dockerfile'] = 'dockerfile'
  }
})
