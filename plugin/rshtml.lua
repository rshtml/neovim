vim.filetype.add({
  extension = {
    rshtml = "rshtml",
  },
})

local function rshtml_ts_setup()
  require('nvim-treesitter.parsers').rshtml = {
    install_info = {
      url = "https://github.com/rshtml/tree-sitter-rshtml",
      -- path = "/home/m/projects/rshtml/tree-sitter-rshtml",
      revision = "a1499c58d4692ec5bc0faed790b4e90ab0fb8996",
      queries = 'queries/neovim',
    },
  }

  vim.treesitter.language.register('rshtml', 'rshtml')
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = rshtml_ts_setup
})
require("nvim-treesitter.install").install({ "html", "rust", "rshtml" })

rshtml_ts_setup()

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
