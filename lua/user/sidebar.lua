local current = ''

local sidebars = {
  NvimTree = {
    toggle = function()
      vim.cmd('NvimTreeToggle')
    end,
    close = function()
      vim.cmd('NvimTreeClose')
    end,
  },
  aerial = {
    toggle = function()
      vim.cmd('AerialToggle')
    end,
    close = function()
      vim.cmd('AerialClose')
    end,
  },
  ['neo-tree'] = {
    toggle = function()
      vim.cmd('Neotree toggle')
    end,
    close = function()
      vim.cmd('Neotree close')
    end,
  },
}

local function exclusive_toggle(t)
  if t ~= current and sidebars[current] ~= nil then
    sidebars[current].close()
  end
  local status, _ = pcall(sidebars[t].toggle)
  if status then
    current = t
  end
end

local function toggle(t)
  sidebars[t].toggle()
end

local function is_current_buffer_sidebar()
  return sidebars[vim.bo.filetype] ~= nil
end

return {
  toggle = toggle,
  exclusive_toggle = exclusive_toggle,
  get_current = function() return current end,
  is_current_buffer_sidebar = is_current_buffer_sidebar,
}
