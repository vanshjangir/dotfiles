local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "hrsh7th/nvim-cmp"
    },
    {
        "L3MON4D3/LuaSnip"
    },
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "neovim/nvim-lspconfig"
    },
    {
        "williamboman/mason.nvim"
    },
    {
        "williamboman/mason-lspconfig.nvim"
    },
    {
        "hrsh7th/cmp-path", after = "nvim-cmp"
    },
    {
        "hrsh7th/cmp-buffer", after = "nvim-cmp"
    },
    {
        "windwp/nvim-autopairs", config = true
    },
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "EdenEast/nightfox.nvim",
        config = function ()
            require("nightfox").setup({
                options = {
                    transparent = true
                }
            })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "BufEnter",
        config = function()
            require("lualine").setup{
                options = {
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_c = {{ "filename", file_status = true, path = 1 }},
                }
            }
        end,
        dependencies = { "nvim-web-devicons" },
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("nvim-tree").setup {
                sync_root_with_cwd = true;
            }
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,

        config = function()
            require("nvim-treesitter.configs").setup{
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "rust", "go" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true, additional_vim_regex_highlighting = false, },
                indent = {
                    enable = true,
                }
            }
        end,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {'lua_ls', 'clangd', 'ts_ls', 'rust_analyzer', 'gopls', 'pyright', 'cssls', 'html'},
                handlers = {
                    lsp_zero.default_setup,
                },
            })

            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
            })

            lsp_zero.on_attach(function(client, bufnr)
                local opts = {buffer = bufnr, remap = false}
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
                vim.keymap.set("n", "gk", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "<leader>R", require('telescope.builtin').lsp_references, { buffer = bufnr, noremap = true, silent = true })
                vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
            end)
        end,
        branch = 'v3.x'
    },
}

require("lazy").setup(plugins, {})
