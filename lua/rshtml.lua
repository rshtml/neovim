local M = {}

M.VERSION = "0.1.3"
M.server_name = vim.fn.has("win32") == 1 and
"rshtml-analyzer.exe" or "rshtml-analyzer"

local function is_version_less(v1, v2)
  local function split_version(v)
    local t = {}
    -- sadece rakamları al, başında v varsa yoksay
    for num in v:gmatch("(%d+)") do
      table.insert(t, tonumber(num))
    end
    return t
  end

  local a, b = split_version(v1), split_version(v2)
  for i = 1, math.max(#a, #b) do
    local n1, n2 = a[i] or 0, b[i] or 0
    if n1 < n2 then return true end
    if n1 > n2 then return false end
  end
  return false
end

function M.install_lsp()
  if vim.fn.executable(M.server_name) ~= 0 then
    local handle = io.popen(M.server_name .. " --version")
    local output = ""
    if handle then
      output = handle:read("*a") or ""
      handle:close()
    end
    local installed_version = output:match("[%d%.]+") or "0.0.0"

    if not is_version_less(installed_version, M.VERSION) then
      return
    end
  end

  if vim.fn.executable("cargo") == 0 then
    vim.notify("Error: 'cargo' not found. Please install Rust: https://rustup.rs/", vim.log.levels.ERROR)
    return
  end

  local cmd_parts = {
    "cargo",
    "install",
    "--git",
    "https://github.com/rshtml/rshtml-analyzer.git",
    "--tag", "v" .. M.VERSION
  }
  
  vim.notify("rshtml-analyzer installing...", vim.log.levels.INFO)

  vim.fn.jobstart(cmd_parts, {
    on_exit = function(_, exit_code)
      if exit_code == 0 then
        vim.notify("rshtml-analyzer installed/updated successfully.", vim.log.levels.INFO)
      else
        vim.notify("An error occurred while installing rshtml-analyzer.", vim.log.levels.ERROR)
      end
    end,
    stdout_buffered = false, stderr_buffered = false,
  })
end

return M
