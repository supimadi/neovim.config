require("config.lazy")


-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- search func
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

vim.opt.termguicolors = true

vim.opt.updatetime = 100

-- set tabs
vim.opt.ts = 4
vim.opt.sw = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- emmet setting
vim.g.user_emmet_leader_key = '<C-L>'

-- windows split 
vim.keymap.set("n", "<space>wv", ':vsplit<CR>', opts)
vim.keymap.set("n", "<space>ww", ':wincmd w<CR>', opts)

-- opts set in a table to not repeat them everytime
local opts = { noremap = true, silent = true }

-- copy and paste to and from system clipboard
vim.keymap.set("v", "<space>cp", '"+y', opts)
vim.keymap.set("n", "<space>pp", '"+p', opts)
vim.keymap.set("v", "<space>pp", '"+p', opts)

-- tab controls
vim.keymap.set("n", "tn", ':tabnew<CR>', opts)
vim.keymap.set("n", "tc", ':tabclose<CR>', opts)
vim.keymap.set("n", "tl", ':tabnext<CR>', opts)
vim.keymap.set("n", "th", ':tabprevious<CR>', opts)

-- open terminal
vim.keymap.set("n", "<space>ot", ':term<CR>', opts)
