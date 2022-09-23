require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'lua', 'rust', 'cmake', 'python', 'bash', 'cuda', 'json' },
  auto_install = true,
  highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 5120,
  },
  context_commentstring = {
    enable = true
  },
}
