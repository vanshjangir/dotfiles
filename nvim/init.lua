require("settings")
require("maps")
require("plugins")

local vim = vim
--#000e1a og bg
--#2e4158 selection
--#424958 separator
vim.cmd("set ls=3")
vim.cmd("colorscheme sonokai")
vim.cmd("set fillchars=eob:\\ ")
vim.cmd([[highlight Normal guibg=none]])
vim.cmd([[highlight NormalFloat guibg=none]])
vim.cmd([[highlight FloatBorder guibg=none]])
vim.cmd([[highlight TabLine guibg=none]])
vim.cmd([[highlight Cursorline guibg=none]])
vim.cmd([[highlight Pmenu guibg=none]])
vim.cmd([[highlight MiniFilesTitle guibg=#000e1a]])
vim.cmd([[highlight MiniFilesTitleFocused guibg=none]])
vim.cmd([[highlight MiniStatuslineDevinfo guibg=none]])
vim.cmd([[highlight MiniStatuslineFileinfo guibg=none]])
vim.cmd([[highlight MiniStatuslineFilename guibg=none]])
vim.cmd([[highlight WinSeparator guifg=#424958]])
vim.cmd([[highlight Visual guibg=#2e4158]])
vim.cmd([[highlight MiniFilesCursorLine guibg=#2e4158]])
vim.cmd([[highlight TelescopeSelection guibg=#2e4158]])
vim.cmd([[autocmd User TelescopePreviewerLoaded setlocal number]])

vim.cmd([[highlight! link NeogitDiffContext Normal]])
vim.cmd([[highlight! link NeogitDiffContextHighlight Normal]])
vim.cmd([[highlight! link DiffContext Normal]])
