local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Fast saving
keymap('n', '<leader>w', ':w!<cr>', opts)

-- Normal --
-- Better window navigation
keymap('n', '<A-H>', '<C-w>h', opts)
keymap('n', '<A-J>', '<C-w>j', opts)
keymap('n', '<A-K>', '<C-w>k', opts)
keymap('n', '<A-L>', '<C-w>l', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
-- keymap('n', '<A-l>', ':bnext<CR>', opts)
-- keymap('n', '<A-h>', ':bprevious<CR>', opts)
vim.api.nvim_exec([[
  nnoremap <silent><expr> <A-l>
    \ &filetype != 'NvimTree' ? ':bnext<CR>' : '\<A-l>'
  nnoremap <silent><expr> <A-h>
    \ &filetype != 'NvimTree' ? ':bprevious<CR>' : '\<A-h>'
  nnoremap <silent><expr> <A-W>
    \ &filetype != 'NvimTree' ? ':Bdelete<CR>' : '\<A-W>'
]], true)

-- Insert --
-- Press jk fast to enter
-- keymap('i', 'jk', '<ESC>', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('v', '<A-j>', ':m .+1<CR>==', opts)
keymap('v', '<A-k>', ':m .-2<CR>==', opts)
keymap('v', 'p', '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap('x', '<A-j>', ':move \'>+1<CR>gv-gv', opts)
keymap('x', '<A-k>', ':move \'<-2<CR>gv-gv', opts)

-- Terminal --
-- Better terminal navigation
keymap('t', '<C-S-h>', '<C-\\><C-N><C-w>h', term_opts)
keymap('t', '<C-S-j>', '<C-\\><C-N><C-w>j', term_opts)
keymap('t', '<C-S-k>', '<C-\\><C-N><C-w>k', term_opts)
keymap('t', '<C-S-l>', '<C-\\><C-N><C-w>l', term_opts)

-- Nvimtree
keymap('n', '<leader>e', ':NvimTreeToggle<cr>', opts)
