local utils = require("hybrid.utils")

local M = {}

-- stylua: ignore start
M.palette = {
    bright_black    = "#373b41",
    bright_red      = "#d54e53",
    bright_yellow   = "#e7c547",
    bright_green    = "#b9ca4a",
    bright_blue     = "#7aa6da",
    bright_magenta  = "#c397d8",
    bright_cyan     = "#70c0b1",
    bright_white    = "#eaeaea",

    black           = "#1d1f21",
    red             = "#cc6666",
    yellow          = "#f0c674",
    green           = "#b5bd68",
    blue            = "#81a2be",
    magenta         = "#b294bb",
    cyan            = "#8abeb7",
    white           = "#c5c8c6",

    dark            = "#151718",
    gray            = "#707880",

    bright_orange   = "#db8743",
    orange          = "#de935f",
}
-- stylua: ignore end

function M.setup()
    local p = M.palette

    -- stylua: ignore start
    local colors = {
        none            = "NONE",

        bg_hard         = p.dark,
        bg              = p.black,
        bg_soft         = p.bright_black,
        fg_soft         = p.gray,
        fg              = p.white,
        fg_hard         = p.bright_white,

        bright_red      = p.bright_red,
        bright_green    = p.bright_green,
        bright_yellow   = p.bright_yellow,
        bright_blue     = p.bright_blue,
        bright_magenta  = p.bright_magenta,
        bright_cyan     = p.bright_cyan,

        red             = p.red,
        green           = p.green,
        yellow          = p.yellow,
        blue            = p.blue,
        magenta         = p.magenta,
        cyan            = p.cyan,

        bright_orange   = p.bright_orange,
        orange          = p.orange,

        diff = {
            delete      = utils.darken(p.red, 0.8, p.bg),
            add         = utils.darken(p.green, 0.8, p.bg),
            change      = utils.darken(p.blue, 0.8, p.bg),
            text        = p.gray,
        },

        diag = {
            error       = p.bright_red,
            warning     = p.bright_yellow,
            info        = p.bright_blue,
            hint        = p.bright_cyan,
            ok          = p.bright_green,
        },

        float = {
            bg          = p.dark,
            border      = utils.darken(p.blue, 0.8, p.dark),
            title       = p.blue,
        },

        line            = utils.darken(p.bright_black, 0.3, p.black),
        comment         = p.gray,
        selection       = p.bright_black,
        match           = p.blue,
        primary         = p.bright_blue,
    }
    -- stylua: ignore end

    return colors
end

return M
