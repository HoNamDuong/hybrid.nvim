local M = {}

M.opts = {
    terminal_colors = true,
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = false,
        emphasis = true,
        comments = true,
        folds = true,
    },
    strikethrough = true,
    inverse = true,
    transparent = false,
    overrides = function(highlights, colors) end,
}

M.setup = function(opts)
    M.opts = vim.tbl_deep_extend("force", M.opts, opts or {})
end

M.load = function()
    if vim.version().minor < 8 then
        vim.notify_once("[hybrid.nvim] You should use Neovim 0.8 or higher.")
    end

    if vim.g.colors_name then
        vim.cmd.hi("clear")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "hybrid"

    local highlights = require("hybrid.highlights").setup(M.opts)

    for group, hl in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, hl)
    end
end

return M
