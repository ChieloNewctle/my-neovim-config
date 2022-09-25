local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

toggleterm.setup {
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  persist_mode = true,
  direction = 'horizontal',
  close_on_exit = true,
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = 'lazygit',
  direction = 'float',
  hidden = true,
  env = {
    GIT_EDITOR = [[nvr -cc close -cc split --remote-wait +'set bufhidden=wipe']]
  },
  on_open = function(term)
    vim.cmd('startinsert!')
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', {noremap = true, silent = true})
  end,
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', {noremap = true, silent = true})
