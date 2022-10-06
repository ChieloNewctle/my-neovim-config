local status_ok, aerial = pcall(require, 'aerial')
if not status_ok then
  return
end

vim.keymap.set('n', '<leader>a', function() require('user.sidebar').toggle('aerial') end,
  { noremap = true, silent = true })

aerial.setup {
  layout = {
    width = 32,
    min_width = 32,
    default_direction = 'right',
  }
}
