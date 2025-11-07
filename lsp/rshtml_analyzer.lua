return {
  cmd = { "rshtml-analyzer", '--stdio' },
  -- cmd = vim.lsp.rpc.connect('127.0.0.1', 9257),
  filetypes = { 'rshtml' },
  root_markers = { 'Cargo.toml', 'Cargo.lock' },
  single_file_support = true,
  on_init = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end,
}
