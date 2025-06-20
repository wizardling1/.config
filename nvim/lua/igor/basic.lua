vim.opt.number = true

vim.opt.tabstop = 2        
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2    
vim.opt.expandtab = true 

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 4
vim.opt.colorcolumn = "100"
vim.opt.updatetime = 50

vim.api.nvim_exec([[
  if exists(':NoMatchParen')
    NoMatchParen
  endif
]], false)

