return {
  'Civitasv/cmake-tools.nvim',
  opts = {
    cmake_generate_on_save = false,
  },
  keys = { -- load the plugin only when using it's keybinding:
    { '<C-g>',      ":CMakeGenerate<cr>", 'CMake generate' },
    { '<C-b>',      ":CMakeBuild<cr>",    'Cmake build' },
    { '<leader>cr', ":CMakeRun<cr>",      'Cmake run' },
  },
}
