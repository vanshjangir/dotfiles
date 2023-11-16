require("settings")
require("maps")
require("plugins")

vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("colorscheme onedark")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("nnoremap <leader>n :NERDTreeFocus<CR>")
vim.cmd("nnoremap <C-n> :NERDTree<CR>")
vim.cmd("nnoremap <A-g> <ESC>:NERDTreeToggle<CR>")
vim.cmd("inoremap <A-g> <ESC>:NERDTreeToggle<CR>")
vim.cmd("let g:minimap_width = 10")
require("bufferline").setup{}
