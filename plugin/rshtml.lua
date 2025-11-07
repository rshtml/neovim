vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
callback = function()
  require('nvim-treesitter.parsers').rshtml = {
    install_info = {
      url = "https://github.com/rshtml/tree-sitter-rshtml",
      revision = "2b295f0e52b605f01f2303c729d7d99932ee3290",
      queries = 'queries/neovim',
    },
  }
end})
require("nvim-treesitter.install").install({ "html", "rust", "rshtml" })

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "rshtml",
  once = true,
  callback = function()
    if vim.fn.executable("rshtml-analyzer") ~= 1 then
      vim.cmd("MasonInstall rshtml-analyzer")
    end
  end,
})
vim.lsp.enable("rshtml_analyzer")

vim.lsp.config('html', {
  filetypes = { 'html', 'rshtml' },
})
vim.lsp.enable("html")
