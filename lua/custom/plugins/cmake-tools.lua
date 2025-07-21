return {
  'Civitasv/cmake-tools.nvim',
  opts = {
    cmake_generate_on_save = false,

  },
  keys = { -- load the plugin only when using it's keybinding:
    { '<leader>cg', ":CMakeGenerate<cr>", 'CMake generate' },
    { '<leader>cb', ":CMakeBuild<cr>",    'Cmake build' },
  },
}
