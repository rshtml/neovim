vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
pattern = "*.rs.html",
 command = "set filetype=rshtml",
})
