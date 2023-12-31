local c = require("hybrid.colors").setup()

local M = {}

M.normal = {
    a = { bg = c.blue, fg = c.bg },
    b = { bg = c.line, fg = c.fg },
    c = { bg = c.line, fg = c.fg },
}

M.insert = {
    a = { bg = c.green, fg = c.bg },
}

M.command = {
    a = { bg = c.yellow, fg = c.bg },
}

M.visual = {
    a = { bg = c.magenta, fg = c.bg },
}

M.replace = {
    a = { bg = c.red, fg = c.bg },
}

M.terminal = {
    a = { bg = c.cyan, fg = c.bg },
}

M.inactive = {
    a = { bg = c.bg, fg = c.fg },
    b = { bg = c.bg, fg = c.fg },
    c = { bg = c.bg, fg = c.fg },
}

return M
