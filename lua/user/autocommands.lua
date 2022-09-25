-- autocmd! remove all autocommands, if entered under a group it will clear that group
vim.cmd [[
  function! SourceProjectConfig() abort
    let l:projectfile = findfile('.vim/local.vim', expand('%:p').';')
    if filereadable(l:projectfile)
      silent execute 'source' l:projectfile
    endif
  endfunction

  augroup _project_config
    autocmd!
    autocmd BufRead,BufNewFile * call SourceProjectConfig()
    if has('nvim')
      autocmd DirChanged * call SourceProjectConfig()
    endif
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]]
