local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
  dashboard.button('f', '  Find file', ':<C-u>CocList files<CR>'),
  dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('p', '  Find project', ':<C-u>CocList project<CR>'),
  dashboard.button('r', '  Recently used files', ':<C-u>CocList mru<CR>'),
  dashboard.button('g', '  Grep text', ':<C-u>CocList grep<CR>'),
  dashboard.button('c', '  Configuration', ':e ~/.config/nvim/init.lua<CR>'),
  dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
  -- local handle = io.popen('fortune')
  -- local fortune = handle:read('*a')
  -- handle:close()
  -- return fortune
  return 'Chielo Newctle'
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = 'Type'
dashboard.section.header.opts.hl = 'Include'
dashboard.section.buttons.opts.hl = 'Keyword'

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
