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

vim.opt.smartindent = true

-- vim.g.python3_host_prog = 'C:\\Users\\ASUS\\.pyenv\\pyenv-win\\versions\\3.9.13'
vim.opt.swapfile = false
vim.opt.scrolloff = 8

-- set tabs
vim.opt.ts = 4
vim.opt.sw = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- emmet setting
vim.g.user_emmet_leader_key = '<C-L>'

-- Stealed from: https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<space>rr", function()
    vim.cmd("so")
end)

-- windows split 
vim.keymap.set("n", "<space>wv", ':vsplit<CR>', opts)
vim.keymap.set("n", "<space>wh", ':hsplit<CR>', opts)
vim.keymap.set("n", "<space>ww", ':wincmd w<CR>', opts)

-- Delete current buffer
vim.keymap.set('n', '<space>bd', ':bdelete<CR>', { desc = 'Delete current buffer' })
vim.keymap.set('n', '<space>ba', ':%bd!<CR>', { desc = 'Close all open buffer' })
vim.keymap.set('n', '<space>bD', ':bdelete!<CR>', { desc = 'Force delete current buffer' })
vim.keymap.set('n', '<space>bq', ':bp|bd #<CR>', { desc = 'Close buffer, keep layout' })

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

-- open neogin
vim.keymap.set("n", "<space>og", ':Neogit<CR>', opts)

-- Nerd Tree
vim.keymap.set("n", "<space>od", ":NERDTreeToggle<CR>", opts)


vim.g.dashboard_custom_header = [[







⣿⠟⣽⣿⣿⣿⣿⣿⢣⠟⠋⡜⠄⢸⣿⣿⡟⣬⢁⠠⠁⣤⠄⢰⠄⠇⢻⢸
⢏⣾⣿⣿⣿⠿⣟⢁⡴⡀⡜⣠⣶⢸⣿⣿⢃⡇⠂⢁⣶⣦⣅⠈⠇⠄⢸⢸
⣹⣿⣿⣿⡗⣾⡟⡜⣵⠃⣴⣿⣿⢸⣿⣿⢸⠘⢰⣿⣿⣿⣿⡀⢱⠄⠨⢸
⣿⣿⣿⣿⡇⣿⢁⣾⣿⣾⣿⣿⣿⣿⣸⣿⡎⠐⠒⠚⠛⠛⠿⢧⠄⠄⢠⣼
⣿⣿⣿⣿⠃⠿⢸⡿⠭⠭⢽⣿⣿⣿⢂⣿⠃⣤⠄⠄⠄⠄⠄⠄⠄⠄⣿⡾
⣼⠏⣿⡏⠄⠄⢠⣤⣶⣶⣾⣿⣿⣟⣾⣾⣼⣿⠒⠄⠄⠄⡠⣴⡄⢠⣿⣵
⣳⠄⣿⠄⠄⢣⠸⣹⣿⡟⣻⣿⣿⣿⣿⣿⣿⡿⡻⡖⠦⢤⣔⣯⡅⣼⡿⣹
⡿⣼⢸⠄⠄⣷⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣕⡜⡌⡝⡸⠙⣼⠟⢱⠏
⡇⣿⣧⡰⡄⣿⣿⣿⣿⡿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣋⣪⣥⢠⠏⠄
⣧⢻⣿⣷⣧⢻⣿⣿⣿⡇⠄⢀⣀⣀⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠂⠄⠄
⢹⣼⣿⣿⣿⣧⡻⣿⣿⣇⣴⣿⣿⣿⣷⢸⣿⣿⣿⣿⣿⣿⣿⣿⣰⠄⠄⠄
⣼⡟⡟⣿⢸⣿⣿⣝⢿⣿⣾⣿⣿⣿⢟⣾⣿⣿⣿⣿⣿⣿⣿⣿⠟⠄⡀⡀
⣿⢰⣿⢹⢸⣿⣿⣿⣷⣝⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠉⠄⠄⣸⢰⡇
⣿⣾⣹⣏⢸⣿⣿⣿⣿⣿⣷⣍⡻⣛⣛⣛⡉⠁⠄⠄⠄⠄⠄⠄⢀⢇⡏⠄
]]
