vim.g.loaded_netrw = 1       -- Disables the default Netrw file explorer
vim.g.loaded_netrwPlugin = 1 -- Disables the Netrw plugin, using neotree instead
vim.opt.termguicolors = true -- Enables 24-bit RGB color support in the terminal

vim.g.mapleader = ' '        -- sets space as leader key
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true -- Enables the use of Nerd Font symbols if installed
vim.opt.number = true -- Shows absolute line numbers
vim.opt.relativenumber = true -- Shows relative line numbers to the current line
vim.opt.mouse = 'a' -- Enables mouse support in all modes
vim.opt.showmode = false -- Hides the mode display (e.g., "-- INSERT --" or "-- NORMAL --")
vim.opt.breakindent = true -- Preserves indentation on line breaks for better readability
vim.opt.undofile = true -- Saves undo history to a file, allowing undo after reopening a file
vim.opt.ignorecase = true -- Ignores case when searching
vim.opt.smartcase = true -- Enables case-sensitive search if uppercase letters are used in the search term
vim.opt.signcolumn = 'yes' -- Always shows the sign column for lint or git signs
vim.opt.updatetime = 250 -- Reduces the delay before updates are triggered (in milliseconds)
vim.opt.timeoutlen = 300 -- Sets the time (in milliseconds) to wait for a mapped sequence to complete
vim.opt.splitright = true -- Opens vertical splits to the right of the current window
vim.opt.splitbelow = true -- Opens horizontal splits below the current window
vim.opt.list = true -- Displays hidden characters such as tabs and spaces
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Defines how hidden characters (tab, trail, nbsp) should be displayed
vim.opt.inccommand = 'split' -- Shows live preview of substitutions, splitting the screen to display changes
vim.opt.cursorline = true -- Highlights the current line under the cursor
vim.opt.scrolloff = 10 -- Keeps at least 10 lines visible above and below the cursor when scrolling

-- use treesitter for folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99

-- sets clipboard when using WSL
if vim.fn.has 'wsl' == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c Get-Clipboard',
      ['*'] = 'powershell.exe -c Get-Clipboard',
    },
    cache_enabled = 0,
  }
end
