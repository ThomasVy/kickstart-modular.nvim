vim.filetype.add({
  extension = {
    pipeline = 'groovy'
  },
  filename = {
    ['JenkinsFile'] = 'groovy',
    ['Jenkinsfile'] = 'groovy'
  }
})

vim.filetype.add({
  extension = {
    dockerfile = 'dockerfile'
  },
  filename = {
    ['Dockerfile'] = 'dockerfile'
  },
  pattern = {
    ['.*/Dockerfile.*'] = 'dockerfile'
  }
})
