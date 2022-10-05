local status_ok, aerial = pcall(require, 'aerial')
if not status_ok then
  return
end

aerial.setup {
  layout = {
    width = 30,
    min_width = 30,
    default_direction = 'left',
  }
}
