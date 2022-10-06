local status_ok, neo_tree = pcall(require, 'neo-tree')
if not status_ok then
  return
end

vim.keymap.set('n', '<leader>e', function() require('user.sidebar').exclusive_toggle('neo-tree') end,
  { noremap = true, silent = true })

vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

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
  },
  buffers = {
    follow_current_file = true,
  },
  source_selector = {
    winbar = true,
    statusline = false
  },
}
