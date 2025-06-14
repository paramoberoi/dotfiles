vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Below 2 lines enable hybrid line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Smart indenting
vim.opt.smartindent = true

-- Enable use of extended colors in the terminal
vim.opt.termguicolors = true

-- Disable python3 provider to fix slow startup of .py files
vim.g.loaded_python3_provider = 0

-- Enable mouse support
vim.opt.mouse = 'a'

-- Keep sign column always visible'-
vim.opt.signcolumn = 'yes'

-- Highlight the current line
vim.opt.cursorline = true

-- Highlight max line length
vim.opt.colorcolumn = '80'

-- Disable swap files
vim.opt.swapfile = false

-- Ignore case if the search pattern is all lowercase, case-sensitive otherwise
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- BLINKY CURSOR
vim.opt.guicursor = {
  "n-v-c:block-Cursor/lCursor",         -- Block cursor in normal, visual, and command modes
  "i:ver25-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",  -- Blinking vertical line in insert mode
  "r-cr-o:hor20-Cursor/lCursor",        -- Horizontal line cursor in replace, command-line replace, and operator-pending modes
  "a:blinkwait700-blinkoff400-blinkon250",  -- Global blinking settings for all modes
}

