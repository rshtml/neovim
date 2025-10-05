local rshtml = require("rshtml")

return {
  cmd = { rshtml.server_name, '--stdio' },
  filetypes = { 'rshtml' },
  root_markers = { 'Cargo.toml', 'Cargo.lock' },
  single_file_support = true,
}
