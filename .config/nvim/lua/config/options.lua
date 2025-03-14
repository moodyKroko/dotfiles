-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local g = vim.g

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.autoformat = false
g.snacks_animate = false

opt.colorcolumn = "80"

opt.swapfile = false
opt.backup = false
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.undodir = (os.getenv("UserProfile") or os.getenv("HOME")) .. "/.vim/undodir"

opt.sessionoptions = "buffers,curdir,folds,help,globals,tabpages,winsize,winpos,terminal,skiprtp,localoptions"

-- highlights
opt.winblend = 0
opt.pumblend = 0

opt.wildmode = "full" --"longest:full,full"
opt.scrolloff = 10

-- hide tab characters
opt.list = false
-- ast = false

opt.signcolumn = "yes"
opt.updatetime = 300

-- test feature
opt.wrap = false -- No Wrap lines
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })

