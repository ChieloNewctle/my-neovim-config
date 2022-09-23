local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  sync_root_with_cwd = true,
  hijack_cursor = true,
  diagnostics = {
    enable = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        { key = "h", cb = tree_cb "close_node" },
      },
    },
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = 'name',
  },
}
