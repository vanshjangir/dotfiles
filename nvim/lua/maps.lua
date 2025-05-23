local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs)
end
map("n", "<leader>F", "<CMD>Telescope find_files<CR>")
map("n", "<leader>G", "<CMD>Telescope git_files<CR>")
map("n", "<leader>f", "<CMD>Telescope current_buffer_fuzzy_find<CR>")
map("n", "<leader>D", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>d", "<CMD>Telescope buffers<CR>")
map("n", "<leader>N", "<CMD>Neogit<CR>")

map("v", "<A-Up>", ":m '<-2<CR>gv=gv")
map("v", "<A-Down>", ":m '>+1<CR>gv=gv")
map("i", "<A-j>", "<Down>")
map("i", "<A-k>", "<Up>")
map("i", "<A-h>", "<Left>")
map("i", "<A-l>", "<Right>")

map("n", "<leader>e", "<CMD>NvimTreeToggle<CR>")
map("n", "<Tab>", "<CMD>b #<CR>")
map("n", "<leader>tn", "<CMD>tabnew | term<CR>")
map("n", "<leader>q", "<CMD>tabclose<CR><CMD>tabp<CR>")

map("i", "<A-n>", "<ESC><CMD>nohlsearch<CR>")
map("n", "<A-n>", "<ESC>")
map("t", "<A-n>", "<C-\\><C-n>")
map("n", "<A-c>", "<CMD>tabn<CR>i")
map("i", "<A-c>", "<CMD>tabn<CR>")
map("t", "<A-c>", "<CMD>tabn<CR>")

map("n", "<A-n>", "<CMD>nohlsearch<CR>")
