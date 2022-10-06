local status_ok, aerial = pcall(require, 'aerial')
if not status_ok then
  return
end

vim.keymap.set('n', '<leader>a', function() require('user.sidebar').exclusive_toggle('aerial') end, { noremap = true, silent = true })

aerial.setup {
  layout = {
    width = 36,
    min_width = 36,
    default_direction = 'left',
  }
}
