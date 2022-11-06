vim.g.jupytext_fmt = 'py:percent'

vim.cmd [[
augroup _jupyter_notebook
  autocmd!
  autocmd FileType python nmap [x <leader>xcic
  autocmd FileType python nmap ]x <leader>xcic]c
augroup end
]]
