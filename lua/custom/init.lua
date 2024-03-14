local autocmd = vim.api.nvim_create_autocmd

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Enable Code Folding Support
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 99
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.g.vscode_snippets_path = "$HOME/.config/nvim/lua/custom/snippets/vscode.code-snippets"

-- scrolloff
vim.opt.so = 10

-- enable relative line numbering by default only for normal mode
vim.opt.relativenumber = true

autocmd("InsertEnter", {pattern = "*", command = "set norelativenumber"})
autocmd("InsertLeave", {pattern = "*", command = "set relativenumber"})
