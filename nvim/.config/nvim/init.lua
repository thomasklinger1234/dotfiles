-- ~/.config/nvim/init.lua

if vim.loader then
	vim.loader.enable()
end

vim.g.mapleader = ","

-- normal esc from terminal window
-- tnoremap <Esc> <C-\><C-n>
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- fast find/replace word under cursor
-- nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
vim.keymap.set("n", "<Leader>s", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", { noremap = true, silent = true })

-- fast escape
-- inoremap jj <ESC>
-- imap jw <ESC>
-- imap jk <ESC>
vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("i", "jk", "<ESC>", { silent = true })
vim.keymap.set("i", "jw", "<ESC>", { silent = true })
vim.keymap.set("t", "jj", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set("t", "jw", [[<C-\><C-n>]], { noremap = true })

-- remap arrow keys to window resize
vim.keymap.set("", "<Up>", "<C-W>2-")
vim.keymap.set("", "<Down>", "<C-W>2+")
vim.keymap.set("", "<Left>", "<C-W>2<")
vim.keymap.set("", "<Right>", "<C-W>2>")

-- remap ctrl+hkjl to jump windows in normal mode
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")

-- Q is a silly place
vim.keymap.set("n", "Q", "<nop>")

require("config.lazy")

------------------------------------------------------------------------------
-- NVIM SETTINGS
------------------------------------------------------------------------------

-- hybrid numbers
vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = false
vim.opt.ruler = false

-- default number of spaces to use for autoindent
vim.o.shiftwidth = 4

-- auto expand tabs
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.autoindent = true

-- show immediately where so far a typed pattern matches
vim.o.incsearch = true

-- default splits to bottom right
vim.o.splitbelow = true
vim.o.splitright = true

-- security
vim.opt.modelines = 0

-- maintain undo history between sessions
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- scroll bounds
vim.o.scrolloff = 13

-- ipad scrolling
vim.opt.mouse = "a"

-- fuzzy find
vim.opt.path:append("**")

-- lazy file name tab completion
vim.opt.wildmode = "list:longest,list:full"
vim.opt.wildmenu = true
vim.opt.wildignorecase = true

-- ignore files vim doesnt use
vim.opt.wildignore:append(".git,.hg,.svn")
vim.opt.wildignore:append(".aux,*.out,*.toc")
vim.opt.wildignore:append(".o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class")
vim.opt.wildignore:append(".ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp")
vim.opt.wildignore:append(".avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg")
vim.opt.wildignore:append(".mp3,*.oga,*.ogg,*.wav,*.flac")
vim.opt.wildignore:append(".eot,*.otf,*.ttf,*.woff")
vim.opt.wildignore:append(".doc,*.pdf,*.cbr,*.cbz")
vim.opt.wildignore:append(".zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb")
vim.opt.wildignore:append(".swp,.lock,.DS_Store,._*")
vim.opt.wildignore:append(".,..")

-- case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true

-- make backspace behave in a sane manner
vim.opt.backspace = "indent,eol,start"

-- searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

-- an indentation every 2 columns
vim.opt.tabstop = 2

-- let backspace delete indent
vim.opt.softtabstop = 2

-- enable auto indentation
vim.opt.autoindent = true