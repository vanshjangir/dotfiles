require("settings")
require("maps")
require("plugins")

local vim = vim

vim.cmd("set ls=3")
vim.cmd("colorscheme sonokai")
vim.cmd("set fillchars=eob:\\ ")
vim.cmd([[highlight Normal guibg=#000e1a]])
vim.cmd([[highlight NormalFloat guibg=#000e1a]])
vim.cmd([[highlight FloatBorder guibg=#000e1a]])
vim.cmd([[highlight Pmenu guibg=#000e1a]])
vim.cmd([[highlight WinSeparator guifg=#2e4158]])
vim.cmd([[highlight TelescopeSelection guibg=#2e4158]])
vim.cmd([[autocmd User TelescopePreviewerLoaded setlocal number]])

local hover = vim.lsp.buf.hover
vim.lsp.buf.hover = function()
    return hover({
        border = "rounded",
        max_width = 60,
    })
end

local open_float = vim.diagnostic.open_float
vim.diagnostic.open_float = function(opts)
    local options = opts or {}
    options.border = "rounded"
    options.max_width = 60
    return open_float(options)
end
