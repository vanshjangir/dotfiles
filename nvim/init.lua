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
vim.cmd([[highlight Normal guibg=#000000]])
vim.cmd([[highlight NormalFloat guibg=#000000]])
vim.cmd([[highlight FloatBorder guibg=#000000]])
vim.cmd([[highlight TabLine guibg=#000000]])
vim.cmd([[highlight Cursorline guibg=#000000]])
vim.cmd([[highlight Pmenu guibg=#000000]])
vim.cmd([[highlight MiniFilesTitle guibg=#000000]])
vim.cmd([[highlight MiniFilesTitleFocused guibg=#000000]])
vim.cmd([[highlight MiniStatuslineDevinfo guibg=#000000]])
vim.cmd([[highlight MiniStatuslineFileinfo guibg=#000000]])
vim.cmd([[highlight MiniStatuslineFilename guibg=#000000]])
vim.cmd([[highlight WinSeparator guifg=#424958]])
vim.cmd([[highlight Visual guibg=#2e4158]])
vim.cmd([[highlight MiniFilesCursorLine guibg=#2e4158]])
vim.cmd([[highlight TelescopeSelection guibg=#2e4158]])
vim.cmd([[autocmd User TelescopePreviewerLoaded setlocal number]])

vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopeFindPre",
  callback = function()
    vim.opt_local.winborder = "none"
    vim.api.nvim_create_autocmd("WinLeave", {
      once = true,
      callback = function()
        vim.opt_local.winborder = "rounded"
      end,
    })
  end,
})
