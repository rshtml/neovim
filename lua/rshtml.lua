local M = {}

function M.setup()
  vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '*.rs.html',
    callback = function()
      vim.bo.filetype = "rshtml"
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'rshtml',
    callback = function()
      vim.lsp.enable('rshtml_analyzer')
    end,
  })
end

return M
