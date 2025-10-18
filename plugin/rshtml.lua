local rshtml_group = vim.api.nvim_create_augroup("rshtml", { clear = true })

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = rshtml_group,
  pattern = '*.rs.html',
  callback = function()
    if vim.bo.filetype ~= "html" then
      vim.bo.filetype = "html"
    end

    local clients = vim.lsp.get_active_clients({ name = "rshtml_analyzer" })
    if #clients == 0 then
      vim.lsp.enable("rshtml_analyzer")
    end
  end,
})

-- vim.api.nvim_create_autocmd('FileType', {
--   group = rshtml_group,
--   pattern = 'rshtml',
--   callback = function()
--   local clients = vim.lsp.get_active_clients({ name = "rshtml_analyzer" })
--     if #clients == 0 then
--       vim.lsp.enable("rshtml_analyzer")
--     end
--   end,
-- })

