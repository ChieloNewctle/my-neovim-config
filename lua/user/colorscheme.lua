local colorscheme = 'ayu-mirage'

local status_ok, ayu = pcall(require, 'ayu')
if colorscheme:find('ayu', 1, true) == 1 and status_ok then
  ayu.setup({
    mirage = true,
  })

  local status_ok, lualine = pcall(require, 'lualine')
  if status_ok then
    lualine.setup({
      options = {
        theme = 'ayu',
      },
    })
  end
end

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end
