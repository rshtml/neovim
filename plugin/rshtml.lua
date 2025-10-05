-- local rshtml = require("rshtml")

-- rshtml.install_lsp()

local rshtml_group = vim.api.nvim_create_augroup("RsHtml", { clear = true })

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = rshtml_group,
  pattern = '*.rs.html',
  callback = function()
    vim.bo.filetype = "rshtml"
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = rshtml_group,
  pattern = 'rshtml',
  callback = function()
  local clients = vim.lsp.get_active_clients({ name = "rshtml_analyzer" })
    if #clients == 0 then
      vim.lsp.enable("rshtml_analyzer")
    end
  end,
})

