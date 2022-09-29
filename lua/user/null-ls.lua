local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
  return
end

null_ls.setup {
  sources = {
    -- null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.cmake_lint,
    -- null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.cmake_format,
  },
}
