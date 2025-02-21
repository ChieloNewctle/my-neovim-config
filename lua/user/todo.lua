local status_ok, todo = pcall(require, 'todo-comments')
if not status_ok then
  return
end

todo.setup {}

vim.keymap.set('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })
vim.keymap.set('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })
