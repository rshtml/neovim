local server_name = vim.fn.has("win32") == 1 and
"rshtml-analyzer.exe" or "rshtml-analyzer"

return {
  cmd = { server_name, '--stdio' },
  filetypes = { 'html' },
  root_markers = { 'Cargo.toml', 'Cargo.lock' },
  single_file_support = true,
}
