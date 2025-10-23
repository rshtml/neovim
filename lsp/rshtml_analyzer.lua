local server_name = vim.fn.has("win32") == 1 and
"rshtml-analyzer.exe" or "rshtml-analyzer"

return {
  cmd = { server_name, '--stdio' },
  -- cmd = vim.lsp.rpc.connect('127.0.0.1', 9257),
  filetypes = { 'html' },
  root_markers = { 'Cargo.toml', 'Cargo.lock' },
  single_file_support = true,
}
