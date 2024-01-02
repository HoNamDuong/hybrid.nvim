local c = require("hybrid.colors").setup()
local utils = require("hybrid.utils")

local M = {}

M.normal = {
    a = { bg = c.blue, fg = c.bg },
    b = { bg = utils.darken(c.blue, 0.2, c.line), fg = c.fg },
    c = { bg = c.line, fg = c.fg },
}

M.insert = {
    a = { bg = c.green, fg = c.bg },
    b = { bg = utils.darken(c.green, 0.2, c.line), fg = c.fg },
}

M.command = {
    a = { bg = c.yellow, fg = c.bg },
    b = { bg = utils.darken(c.yellow, 0.2, c.line), fg = c.fg },
}

M.visual = {
    a = { bg = c.magenta, fg = c.bg },
    b = { bg = utils.darken(c.magenta, 0.2, c.line), fg = c.fg },
}

M.replace = {
    a = { bg = c.red, fg = c.bg },
    b = { bg = utils.darken(c.red, 0.2, c.line), fg = c.fg },
}

M.terminal = {
    a = { bg = c.cyan, fg = c.bg },
    b = { bg = utils.darken(c.cyan, 0.2, c.line), fg = c.fg },
}

M.inactive = {
    a = { bg = c.bg, fg = c.fg },
    b = { bg = c.bg, fg = c.fg },
    c = { bg = c.bg, fg = c.fg },
}

return M
