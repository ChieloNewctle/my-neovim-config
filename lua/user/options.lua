local options = {
  backup = false,                          -- creates a backup file
  clipboard = 'unnamedplus',               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { 'menuone', 'noselect' }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = 'utf-8',                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = 'a',                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = 'yes',                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = 'monospace:h17',               -- the font used in graphical neovim applications
  foldmethod = 'expr',
  foldexpr = 'nvim_treesitter#foldexpr()',
  foldlevel = 99,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Don't redraw while executing macros (good performance config)
vim.opt.lazyredraw = true

-- For regular expressions turn magic on
vim.opt.magic = true

-- Indenting
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.showbreak = '↪ '
vim.opt.list = true
vim.opt.listchars = {
  tab = '<->',
  -- eol = '↵',
  nbsp = '␣',
  trail = '',
  extends = '›',
  precedes = '‹',
}

vim.opt.shortmess:append 'c'
vim.cmd [[set whichwrap+=<,>,[,],h,l]]
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

vim.cmd [[command! W execute 'w !sudo tee % > /dev/null' <bar> edit!]]

vim.cmd [[au FocusGained,BufEnter * :checktime]]

vim.cmd [[set guicursor+=a:blinkwait200-blinkon200-blinkoff50]]
