local colorscheme = 'catppuccin'

vim.cmd [[
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif
]]

-- Catppuccin
vim.g.catppuccin_flavour = 'mocha'
require('catppuccin').setup {
  term_colors = true,
  styles = {
    comments = {},
    conditionals = {},
  },
  integrations = {
    aerial = true,
    cmp = true,
    dashboard = true,
    gitsigns = true,
    markdown = true,
    neotree = true,
    telescope = true,
    treesitter = true,
    treesitter_context = true,
    which_key = true,
    dap = {
      enabled = true,
      enable_ui = true,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = {},
        hints = {},
        warnings = {},
        information = {},
      },
    },
  },
}

-- Material
vim.g.material_theme_style = 'palenight'

-- Ayu
local status_ok, ayu = pcall(require, 'ayu')
if colorscheme:find('ayu', 1, true) == 1 and status_ok then
  ayu.setup({
    mirage = true,
  })
end

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end

return {
  colorscheme = colorscheme,
}
