local status_ok, neo_tree = pcall(require, 'neo-tree')
if not status_ok then
  return
end

vim.keymap.set('n', '<leader>e', function() require('user.sidebar').exclusive_toggle('neo-tree') end,
  { noremap = true, silent = true })

vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

vim.fn.sign_define('DiagnosticSignError',
  {text = ' ', texthl = 'DiagnosticSignError'})
vim.fn.sign_define('DiagnosticSignWarn',
  {text = ' ', texthl = 'DiagnosticSignWarn'})
vim.fn.sign_define('DiagnosticSignInfo',
  {text = ' ', texthl = 'DiagnosticSignInfo'})
vim.fn.sign_define('DiagnosticSignHint',
  {text = ' ', texthl = 'DiagnosticSignHint'})

neo_tree.setup {
  close_if_last_window = true,
  enable_git_status = true,
  enable_diagnostics = true,
  window = {
    position = 'left',
    width = 36,
  },
  filesystem = {
    filtered_items = {
      always_show = {
        '.gitignored',
      },
    },
    hijack_netrw_behavior = 'open_default',
    follow_current_file = true,
  },
  buffers = {
    follow_current_file = true,
  },
  source_selector = {
    winbar = true,
    statusline = false
  },
}
