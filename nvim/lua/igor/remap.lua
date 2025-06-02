
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<Up>', '<NOP>')
vim.keymap.set('n', '<Down>', '<NOP>')
vim.keymap.set('n', '<Left>', '<NOP>')
vim.keymap.set('n', '<Right>', '<NOP>')

-- Disable arrow keys in insert mode
vim.keymap.set('i', '<Up>', '<NOP>')
vim.keymap.set('i', '<Down>', '<NOP>')
vim.keymap.set('i', '<Left>', '<NOP>')
vim.keymap.set('i', '<Right>', '<NOP>')


-- other
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>cc", ":Telescope colorscheme<CR>")
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Scroll down 10 lines
vim.keymap.set('n', '<C-j>', '10j', { noremap = true, silent = true })
vim.keymap.set('v', '<C-j>', '10j', { noremap = true, silent = true })
-- Scroll up 10 lines
vim.keymap.set('n', '<C-k>', '10k', { noremap = true, silent = true })
vim.keymap.set('v', '<C-k>', '10k', { noremap = true, silent = true })

-- tabs
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })


