local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {"sainnhe/sonokai"},
    {"williamboman/mason.nvim"},
    {"neovim/nvim-lspconfig"},
    {"nvim-tree/nvim-web-devicons"},
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        opts = {
            keymap = {
                preset = "default",
                ["<CR>"] = { "select_and_accept", "fallback" }
            },
            completion = { documentation = { auto_show = true } },
            fuzzy = { implementation = "prefer_rust" },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {"lewis6991/gitsigns.nvim"},
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "sindrets/diffview.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
    },
    {
        "echasnovski/mini.nvim",
        version = "*",
    },
}

require("lazy").setup(plugins, {})
require("gitsigns").setup()
require("mason").setup()
require("nvim-treesitter.configs").setup{
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    indent = { enable = true },
}
require("mini.files").setup()
require("mini.comment").setup()
require("mini.move").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.statusline").setup()
require("mini.indentscope").setup({
    draw = {
        delay = 0,
        animation = require("mini.indentscope").gen_animation.none()
    },
    options = { try_as_border = true }
})
require("telescope").setup{
    defaults = {
        layout_strategy = "vertical",
        layout_config = { preview_cutoff = 0 },
    }
}

local opts = { buffer = bufnr, remap = false }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>R", require("telescope.builtin").lsp_references, opts)
vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

vim.lsp.enable({
    "gopls",
    "pyright",
    "python-lsp-server",
    "zls",
    "rust_analyzer",
    "clangd",
    "ts_ls",
    "cssls",
    "html",
    "lua_ls",
})
