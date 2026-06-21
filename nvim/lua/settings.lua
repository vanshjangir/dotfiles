function _G.MyTabLine()
    local s = ""
    local tabs = vim.fn.tabpagenr("$")
    local width = math.floor(vim.o.columns / math.max(tabs, 1))

    for i = 1, tabs do
        local hl = i == vim.fn.tabpagenr() and "%#TabLineSel#" or "%#TabLine#"

        local buflist = vim.fn.tabpagebuflist(i)
        local winnr = vim.fn.tabpagewinnr(i)
        local name = vim.fn.fnamemodify(
            vim.fn.bufname(buflist[winnr]),
            ":t"
        )

        local label = "[" .. i .. "] " .. name
        local pad = math.max(0, width - vim.fn.strdisplaywidth(label))
        s = s .. hl .. label .. string.rep(" ", pad)
    end
    return s
end

local g = vim.g
local o = vim.o

g.mapleader = " "
g.maplocalleader = " "
g.sonokai_transparent_background = 2
o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.autoindent = true
o.showtabline = 2
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.ruler = true
o.mouse = "a"
o.title = true
o.hidden = true
o.showmatch = true
o.inccommand = "split"
o.termguicolors = true
o.pumheight = 10
o.jumpoptions = "stack"
o.guicursor = "i:block"
o.cursorline = true
o.winborder = "rounded"
o.guicursor = "i:hor20,t:hor20"
o.tabline = "%!v:lua.MyTabLine()"
