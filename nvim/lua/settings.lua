function _G.MyTabLine()
    local s = ""
    local tabs = vim.fn.tabpagenr("$")

    for i = 1, tabs do
        local hl = i == vim.fn.tabpagenr() and "%#TabLineSel#" or "%#TabLine#"
        local buflist = vim.fn.tabpagebuflist(i)
        local winnr = vim.fn.tabpagewinnr(i)
        local name = vim.fn.fnamemodify(
            vim.fn.bufname(buflist[winnr]),
            ":t"
        )

        local label = "[" .. i .. "] " .. name
        s = s .. hl .. label .. " "
    end
    return s
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.sonokai_transparent_background = 2
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.autoindent = true
vim.o.showtabline = 2
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.ruler = true
vim.o.mouse = "a"
vim.o.title = true
vim.o.hidden = true
vim.o.showmatch = true
vim.o.inccommand = "split"
vim.o.termguicolors = true
vim.o.pumheight = 10
vim.o.jumpoptions = "stack"
vim.o.guicursor = "i:block"
vim.o.cursorline = true
vim.o.winborder = "rounded"
vim.o.guicursor = "i:hor20,t:hor20"
vim.o.tabline = "%!v:lua.MyTabLine()"
