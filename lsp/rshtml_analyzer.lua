return {
  cmd = { 'rshtml-analyzer', '--stdio' },
  filetypes = { 'rshtml' },
  root_markers = { 'Cargo.toml', 'Cargo.lock' },
  single_file_support = true,
}
