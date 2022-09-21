local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap


-- Autocomplete
vim.api.nvim_exec([[
  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  
  inoremap <silent><expr> <C-j>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<C-j>" :
    \ coc#refresh()
  inoremap <silent><expr> <C-k>
    \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
  inoremap <silent><expr> <Tab> 
    \ coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
  
  inoremap <silent><expr> <C-f> 
    \ coc#pum#visible() ? coc#pum#scroll(1) : "\<C-f>"
  inoremap <silent><expr> <C-b> 
    \ coc#pum#visible() ? coc#pum#scroll(0) : "\<C-b>"
]], true)


-- Navigation
keymap('n', 'gd', '<Plug>(coc-definition)', opts)
keymap('n', 'gD', '<Plug>(coc-type-definition)', opts)
keymap('n', 'gi', '<Plug>(coc-implementation)', opts)
keymap('n', 'gr', '<Plug>(coc-references)', opts)

keymap('n', 'K', ':lua show_documentation()', opts)

function show_documentation()
  local filetype = vim.bo.filetype
  if filetype == 'vim' or filetype == 'help' then
    vim.api.nvim_command('h ' .. vim.fn.expand('<cword>'))
  elseif vim.fn['coc#rpc#ready']() then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command(
      '!' .. vim.bo.keywordprg .. ' ' .. vim.fn.expand('<cword>')
    )
  end
end


vim.api.nvim_exec([[
  autocmd CursorHold * silent call CocActionAsync('highlight')
  augroup coc_action_group
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

    " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocActionAsync('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
]], true)


-- Range select
keymap('n', '<C-s>', '<Plug>(coc-range-select)', opts)
keymap('v', '<C-s>', '<Plug>(coc-range-select)', opts)
keymap('n', '<C-S>', '<Plug>(coc-range-select-backward)', opts)
keymap('v', '<C-S>', '<Plug>(coc-range-select-backward)', opts)


-- Code action
keymap('n', '<leader>rn', '<Plug>(coc-rename)', opts)

keymap('n', '<leader>F', '<Plug>(coc-format)', opts)
keymap('v', '<leader>F', '<Plug>(coc-format-selected)', opts)

keymap('n', '<leader>ca', '<Plug>(coc-codeaction)', opts)
keymap('v', '<leader>ca', '<Plug>(coc-codeaction-selected)', opts)

keymap('n', '<leader>cl', '<Plug>(coc-codelens-action)', opts)
keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', opts)


-- Select inside/around function and class text objects
keymap('x', 'if', '<Plug>(coc-funcobj-i)', opts)
keymap('x', 'af', '<Plug>(coc-funcobj-a)', opts)
keymap('x', 'ic', '<Plug>(coc-classobj-i)', opts)
keymap('x', 'ac', '<Plug>(coc-classobj-a)', opts)
keymap('o', 'if', '<Plug>(coc-funcobj-i)', opts)
keymap('o', 'af', '<Plug>(coc-funcobj-a)', opts)
keymap('o', 'ic', '<Plug>(coc-classobj-i)', opts)
keymap('o', 'ac', '<Plug>(coc-classobj-a)', opts)


-- Mappings for CoCList
-- Show all diagnostics.
keymap('n', '<space>a', ':<C-u>CocList diagnostics<CR>', opts)
-- Manage extensions.
keymap('n', '<space>e', ':<C-u>CocList extensions<CR>', opts)
-- Show commands.
keymap('n', '<space>c', ':<C-u>CocList commands<CR>', opts)
-- Find symbol of current document.
keymap('n', '<space>o', ':<C-u>CocList outline<CR>', opts)
-- Search workspace symbols.
keymap('n', '<space>s', ':<C-u>CocList -I symbols<CR>', opts)
-- Do default action for next item.
keymap('n', '<space>j', ':<C-u>CocNext<CR>', opts)
-- Do default action for previous item.
keymap('n', '<space>k', ':<C-u>CocPrev<CR>', opts)
-- Resume latest coc list.
keymap('n', '<space>p', ':<C-u>CocListResume<CR>', opts)
