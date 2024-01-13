local utils = require("hybrid.utils")

local M = {}

-- stylua: ignore start
M.palette = {
    bright_black    = "#373b41",
    black           = "#1d1f21",
    dull_black      = "#151718",

    bright_white    = "#eaeaea",
    white           = "#c5c8c6",
    dull_white      = "#707880",

    bright_red      = "#d54e53",
    red             = "#cc6666",
    dull_red        = "#a54242",

    bright_green    = "#b9ca4a",
    green           = "#b5bd68",
    dull_green      = "#8c9440",

    bright_yellow   = "#e7c547",
    yellow          = "#f0c674",
    dull_yellow     = "#de935f",

    bright_blue     = "#7aa6da",
    blue            = "#81a2be",
    dull_blue       = "#5f819d",

    bright_magenta  = "#c397d8",
    magenta         = "#b294bb",
    dull_magenta    = "#85678f",

    bright_cyan     = "#70c0b1",
    cyan            = "#8abeb7",
    dull_cyan       = "#5e8d87",
}
-- stylua: ignore end

function M.setup()
    local p = M.palette

    -- stylua: ignore start
    local colors = {
        none            = "NONE",

        bg_hard         = p.dull_black,
        bg              = p.black,
        bg_soft         = p.bright_black,

        fg_soft         = p.dull_white,
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

        dull_red        = p.dull_red,
        dull_green      = p.dull_green,
        dull_yellow     = p.dull_yellow,
        dull_blue       = p.dull_blue,
        dull_magenta    = p.dull_magenta,
        dull_cyan       = p.dull_cyan,

        diff = {
            delete      = p.dull_red,
            add         = p.dull_green,
            change      = p.dull_blue,
            text        = p.dull_white,
        },

        diag = {
            error       = p.bright_red,
            warning     = p.bright_yellow,
            info        = p.bright_blue,
            hint        = p.bright_cyan,
            ok          = p.bright_green,
        },

        float = {
            bg          = p.dull_black,
            border      = p.dull_blue,
            title       = p.blue,
        },

        line            = utils.darken(p.bright_black, 0.4, p.black),
        comment         = p.dull_white,
        selection       = p.bright_black,
        match           = p.blue,
        primary         = p.bright_blue,
    }
    -- stylua: ignore end

    return colors
end

return M
