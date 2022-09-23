local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

toggleterm.setup({
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  persist_mode = true,
  direction = 'vertical',
  close_on_exit = true,
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-H>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-J>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-K>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-L>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', direction = 'float', hidden = true })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})
