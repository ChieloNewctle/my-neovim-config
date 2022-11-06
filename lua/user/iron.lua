local status_ok, iron = pcall(require, 'iron.core')
if not status_ok then
  return
end

iron.setup {
  config = {
    scratch_repl = true,
    repl_open_cmd = require('iron.view').split.vertical.botright(0.5),
  },
  keymaps = {
    send_motion = '<leader>xc',
    visual_send = '<leader>xc',
    send_file = '<leader>xf',
    send_line = '<leader>xl',
    cr = '<leader>x<cr>',
    interrupt = '<leader>xi',
    exit = '<leader>xq',
    clear = '<leader>xj',
  },
}
