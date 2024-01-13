local utils = require("hybrid.utils")

local M = {}

function M.setup(opts)
    local c = require("hybrid.colors").setup()

    local highlights = {
        -- Highlight default
        -- :h highlight-default
        -- {{{
        ColorColumn = { bg = c.bg_hard },
        Conceal = { fg = c.dull_blue },
        CurSearch = { fg = c.green, bg = c.bg, reverse = opts.inverse },
        Cursor = { reverse = opts.inverse },
        -- lCursor = {},
        -- CursorIM = {},
        CursorColumn = { link = "CursorLine" },
        CursorLine = { bg = c.line },
        Directory = { fg = c.blue },
        DiffAdd = { bg = utils.darken(c.diff.add, 0.1, c.bg) },
        DiffChange = { bg = utils.darken(c.diff.change, 0.1, c.bg) },
        DiffDelete = { bg = utils.darken(c.diff.delete, 0.1, c.bg) },
        DiffText = { bg = utils.darken(c.diff.text, 0.6, utils.darken(c.diff.change, 0.1, c.bg)) },
        EndOfBuffer = { fg = c.fg_soft },
        -- TermCursor  = {},
        -- TermCursorNC= {},
        ErrorMsg = { fg = c.diag.error },
        WinSeparator = { fg = c.fg_soft, bg = opts.transparent and c.none or c.bg },
        Folded = { fg = c.fg_soft, bg = c.line, italic = opts.italic.folds },
        FoldColumn = { fg = c.fg_soft, bg = opts.transparent and c.none or c.bg },
        SignColumn = { fg = c.fg_soft, bg = opts.transparent and c.none or c.bg },
        IncSearch = { fg = c.dull_yellow, bg = c.bg, reverse = opts.inverse },
        -- Substitute = {},
        LineNr = { fg = c.bg_soft, bg = opts.transparent and c.none or c.bg },
        -- LineNrAbove = {},
        -- LineNrBelow = {},
        CursorLineNr = { fg = c.primary, bg = c.line },
        -- CursorLineFold = {},
        -- CursorLineSign = {},
        MatchParen = { bg = c.selection, bold = opts.bold },
        -- ModeMsg = {},
        -- MsgArea = {},
        -- MsgSeparator = {},
        MoreMsg = { fg = c.primary },
        NonText = { fg = c.bg_soft },
        Normal = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
        NormalFloat = { fg = c.fg, bg = c.float.bg },
        FloatBorder = { fg = c.float.border, bg = c.float.bg },
        FloatTitle = { fg = c.float.title, bg = c.float.bg },
        NormalNC = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
        Pmenu = { fg = c.fg, bg = c.bg_hard },
        PmenuSel = { bg = c.selection, bold = opts.bold },
        -- PmenuKind = {},
        -- PmenuKindSel = {},
        -- PmenuExtra = {},
        -- PmenuExtraSel = {},
        PmenuSbar = { bg = c.bg_hard },
        PmenuThumb = { bg = c.selection },
        Question = { fg = c.primary },
        QuickFixLine = { bg = c.selection, bold = opts.bold },
        Search = { fg = c.yellow, bg = c.bg, reverse = opts.inverse },
        SpecialKey = { fg = c.primary },
        SpellBad = { sp = c.diag.error, undercurl = opts.undercurl },
        SpellCap = { sp = c.diag.warning, undercurl = opts.undercurl },
        SpellLocal = { sp = c.diag.info, undercurl = opts.undercurl },
        SpellRare = { sp = c.diag.hint, undercurl = opts.undercurl },
        StatusLine = { fg = c.fg, bg = c.line },
        StatusLineNC = { fg = c.fg, bg = c.bg },
        TabLine = { fg = c.fg, bg = c.bg_hard },
        TabLineFill = { fg = c.fg, bg = c.bg_hard },
        TabLineSel = { fg = c.fg, bg = c.bg, bold = opts.bold },
        Title = { fg = c.primary, bold = opts.bold },
        Visual = { bg = utils.lighten(c.selection, 0.8, c.primary) },
        VisualNOS = { link = "Visual" },
        WarningMsg = { fg = c.diag.warning },
        Whitespace = { link = "NonText" },
        WildMenu = { fg = c.fg, bg = c.selection, bold = opts.bold },
        WinBar = { fg = c.fg, bg = c.bg },
        WinBarNC = { fg = c.fg, bg = c.bg },
        -- }}}

        -- Syntax highlighting
        -- :h group-name
        -- {{{
        Comment = { fg = c.comment, italic = opts.italic.comments },

        Constant = { fg = c.dull_yellow },
        String = { fg = c.green, italic = opts.italic.strings },
        Character = { fg = c.green },
        -- Number = {},
        -- Boolean = {},
        -- Float = {},

        Identifier = { fg = c.fg },
        Function = { fg = c.blue },

        Statement = { fg = c.magenta },
        -- Conditional = {},
        -- Repeat = {},
        -- Label = {},
        Operator = { fg = c.blue },
        -- Keyword = {},
        -- Exception = {},

        PreProc = { fg = c.magenta },
        -- Include = {},
        -- Define = {},
        -- Macro = {},
        -- PreCondit = {},

        Type = { fg = c.bright_cyan },
        -- StorageClass = {},
        -- Structure = {},
        -- Typedef = {},

        Special = { fg = c.bright_blue },
        -- SpecialChar = {},
        -- Tag = {},
        Delimiter = { fg = c.fg },
        -- SpecialComment = {},
        Debug = { fg = c.dull_yellow },

        Underlined = { underline = opts.underline },

        Ignore = { link = "NonText" },

        Error = { fg = c.diag.error, reverse = opts.inverse },

        Todo = { fg = c.diag.hint, reverse = opts.inverse }, -- TODO FIXME XXX
        -- }}}

        -- Treesitter
        -- :h treesitter-highlight
        -- Source https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights
        -- {{{
        -- -- Misc
        -- @comment (Comment)                   ; line and block comments
        -- @comment.documentation               ; comments documenting code
        -- @error                               ; syntax/parser errors
        -- @none                                ; completely disable the highlight
        -- @preproc (PreProc)                   ; various preprocessor directives & shebangs
        -- @define (Define)                     ; preprocessor definition directives
        -- @operator (Operator)                 ; symbolic operators (e.g. `+` / `*`)

        ["@none"] = {},

        -- -- Punctuation (Delimiter)
        -- @punctuation.delimiter               ; delimiters (e.g. `;` / `.` / `,`)
        -- @punctuation.bracket                 ; brackets (e.g. `()` / `{}` / `[]`)
        -- @punctuation.special                 ; special symbols (e.g. `{}` in string interpolation)

        ["@punctuation.special"] = { link = "Special" },

        -- -- Literals
        -- @string (String)                     ; string literals
        -- @string.documentation                ; string documenting code (e.g. Python docstrings)
        -- @string.regex                        ; regular expressions
        -- @string.escape (SpecialChar)         ; escape sequences
        -- @string.special (SpecialChar)        ; other special strings (e.g. dates)

        -- @character (Character)               ; character literals
        -- @character.special (SpecialChar)     ; special characters (e.g. wildcards)

        -- @boolean (Boolean)                   ; boolean literals
        -- @number (Number)                     ; numeric literals
        -- @float (Float)                       ; floating-point number literals

        ["@string.escape"] = { fg = c.magenta },

        -- -- Functions
        -- @function (Function)                 ; function definitions
        -- @function.builtin (Special)          ; built-in functions
        -- @function.call                       ; function calls
        -- @function.macro (Macro)              ; preprocessor macros

        -- @method (Function)                   ; method definitions
        -- @method.call                         ; method calls

        -- @constructor (Special)               ; constructor calls and definitions
        -- @parameter (Identifier)              ; parameters of a function

        ["@function.builtin"] = { fg = c.red },
        ["@constructor"] = { fg = c.magenta },
        ["@parameter"] = { fg = c.yellow },

        -- -- Keywords
        -- @keyword (Keyword)                   ; various keywords
        -- @keyword.coroutine                   ; keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
        -- @keyword.function                    ; keywords that define a function (e.g. `func` in Go, `def` in Python)
        -- @keyword.operator                    ; operators that are English words (e.g. `and` / `or`)
        -- @keyword.return                      ; keywords like `return` and `yield`

        -- @conditional (Conditional)           ; keywords related to conditionals (e.g. `if` / `else`)
        -- @conditional.ternary                 ; ternary operator (e.g. `?` / `:`)

        -- @repeat (Repeat)                     ; keywords related to loops (e.g. `for` / `while`)
        -- @debug (Debug)                       ; keywords related to debugging
        -- @label (Label)                       ; GOTO and other labels (e.g. `label:` in C)
        -- @include (Include)                   ; keywords for including modules (e.g. `import` / `from` in Python)
        -- @exception (Exception)               ; keywords related to exceptions (e.g. `throw` / `catch`)

        ["@keyword.operator"] = { link = "@operator" },

        -- -- Types
        -- @type (Type)                         ; type or class definitions and annotations
        -- @type.builtin                        ; built-in types
        -- @type.definition (Typedef)           ; identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
        -- @type.qualifier                      ; type qualifiers (e.g. `const`)

        -- @storageclass (StorageClass)         ; modifiers that affect storage in memory or life-time
        -- @attribute                           ; attribute annotations (e.g. Python decorators)
        -- @field (Identifier)                  ; object and struct fields
        -- @property (Identifier)               ; similar to `@field`

        ["@field"] = { fg = c.cyan },
        ["@property"] = { fg = c.cyan },

        -- -- Identifiers
        -- @variable (Identifier)               ; various variable names
        -- @variable.builtin                    ; built-in variable names (e.g. `this`)

        -- @constant (Constant)                 ; constant identifiers
        -- @constant.builtin (Special)          ; built-in constant values
        -- @constant.macro (Define)             ; constants defined by the preprocessor

        -- @namespace (Identifier)              ; modules or namespaces
        -- @symbol                              ; symbols or atoms

        ["@variable.builtin"] = { fg = c.red },
        ["@namespace.builtin"] = { fg = c.red },

        -- -- Text
        -- @text                                ; non-structured text
        -- @text.strong                         ; bold text
        -- @text.emphasis                       ; text with emphasis
        -- @text.underline (Underlined)         ; underlined text
        -- @text.strike                         ; strikethrough text
        -- @text.title (Title)                  ; text that is part of a title
        -- @text.quote                          ; text quotations
        -- @text.uri (Underlined)               ; URIs (e.g. hyperlinks)
        -- @text.math                           ; math environments (e.g. `$ ... $` in LaTeX)
        -- @text.environment                    ; text environments of markup languages
        -- @text.environment.name               ; text indicating the type of an environment
        -- @text.reference (Identifier)         ; text references, footnotes, citations, etc.

        -- @text.literal (Comment)              ; literal or verbatim text (e.g., inline code)
        -- @text.literal.block                  ; literal or verbatim text as a stand-alone block
        --                                      ; (use priority 90 for blocks with injections)

        -- @text.todo (Todo)                    ; TODO notes
        -- @text.note                           ; INFO notes
        -- @text.warning                        ; WARNING notes
        -- @text.danger                         ; ERROR notes

        -- @text.diff.add                       ; added text (for diff files)
        -- @text.diff.delete                    ; deleted text (for diff files)

        ["@text.strong"] = { bold = opts.bold },
        ["@text.emphasis"] = { italic = opts.italic.emphasis },
        ["@text.strike"] = { strikethrough = opts.strikethrough },

        ["@text.literal"] = { link = "String" },

        ["@text.todo"] = { fg = c.diag.hint, reverse = opts.inverse },
        ["@text.note"] = { fg = c.diag.info, reverse = opts.inverse },
        ["@text.warning"] = { fg = c.diag.warning, reverse = opts.inverse },
        ["@text.danger"] = { fg = c.diag.error, reverse = opts.inverse },

        -- -- Tags
        -- @tag (Tag)                           ; XML tag names
        -- @tag.attribute                       ; XML tag attributes
        -- @tag.delimiter                       ; XML tag delimiter

        ["@tag"] = { link = "Label" },
        ["@tag.attribute"] = { link = "@property" },
        ["@tag.delimiter"] = { link = "Delimiter" },

        -- -- Conceal
        -- @conceal                             ; for captures that are only used for concealing

        -- -- Spell
        -- @spell                               ; for defining regions to be spellchecked
        -- @nospell                             ; for defining regions that should NOT be spellchecked
        -- }}}

        -- Diagnostics
        -- :h diagnostic-highlights
        DiagnosticError = { fg = c.diag.error },
        DiagnosticWarn = { fg = c.diag.warning },
        DiagnosticInfo = { fg = c.diag.info },
        DiagnosticHint = { fg = c.diag.hint },
        DiagnosticOk = { fg = c.diag.ok },
        DiagnosticUnderlineError = { undercurl = opts.undercurl, sp = c.diag.error },
        DiagnosticUnderlineWarn = { undercurl = opts.undercurl, sp = c.diag.warning },
        DiagnosticUnderlineInfo = { undercurl = opts.undercurl, sp = c.diag.info },
        DiagnosticUnderlineHint = { undercurl = opts.undercurl, sp = c.diag.hint },
        DiagnosticUnderlineOk = { undercurl = opts.undercurl, sp = c.diag.ok },
        DiagnosticVirtualTextError = { bg = utils.darken(c.diag.error, 0.1, c.bg), fg = c.diag.error },
        DiagnosticVirtualTextWarn = { bg = utils.darken(c.diag.warning, 0.1, c.bg), fg = c.diag.warning },
        DiagnosticVirtualTextInfo = { bg = utils.darken(c.diag.info, 0.1, c.bg), fg = c.diag.info },
        DiagnosticVirtualTextHint = { bg = utils.darken(c.diag.hint, 0.1, c.bg), fg = c.diag.hint },
        DiagnosticVirtualTextOk = { bg = utils.darken(c.diag.ok, 0.1, c.bg), fg = c.diag.hint },

        -- NeoVim
        healthError = { link = "DiagnosticError" },
        healthSuccess = { link = "DiagnosticOk" },
        healthWarning = { link = "DiagnosticWarn" },

        -- diff
        diffAdded = { fg = c.diff.add },
        diffRemoved = { fg = c.diff.delete },
        diffChanged = { fg = c.diff.change },
        diffOldFile = { fg = c.yellow },
        diffNewFile = { fg = c.dull_yellow },
        diffFile = { fg = c.blue },
        diffLine = { fg = c.comment },
        diffIndexLine = { fg = c.magenta },

        -- LSP highlight
        -- :h lsp-highlight
        LspReferenceRead = { bg = c.selection, bold = opts.bold },
        LspReferenceText = { bg = c.selection, bold = opts.bold },
        LspReferenceWrite = { bg = c.selection, bold = opts.bold },
        LspSignatureActiveParameter = { link = "Visual" },

        -- Lspconfig
        -- :h lspconfig-highlight
        LspInfoBorder = { link = "FloatBorder" },

        -- -- LSP Semantic Token
        -- :h lsp-semantic-highlight
        -- {{{
        -- for the type
        ["@lsp.type.namespace"] = { link = "@namespace" },
        -- ["@lsp.type.class"] = {},
        -- ["@lsp.type.enum"] = {},
        -- ["@lsp.type.interface"] = {},
        -- ["@lsp.type.struct"] = {},
        -- ["@lsp.type.typeParameter"] = {},
        ["@lsp.type.type"] = { link = "@type" },
        ["@lsp.type.parameter"] = { link = "@parameter" },
        ["@lsp.type.variable"] = {}, -- use treesitter styles
        ["@lsp.type.property"] = { link = "@property" },
        -- ["@lsp.type.enumMember"] = {},
        -- ["@lsp.type.decorator"] = {},
        -- ["@lsp.type.event"] = {},
        ["@lsp.type.function"] = { link = "@function" },
        ["@lsp.type.method"] = { link = "@method" },
        ["@lsp.type.macro"] = { link = "@function.macro" },
        ["@lsp.type.label"] = { link = "@label" },
        ["@lsp.type.comment"] = {}, -- use treesitter styles
        ["@lsp.type.string"] = { link = "@string" },
        ["@lsp.type.keyword"] = { link = "@keyword" },
        ["@lsp.type.number"] = { link = "@number" },
        -- ["@lsp.type.regexp"] = {},
        ["@lsp.type.operator"] = { link = "@operator" },

        -- for each modifier
        ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
        -- }}}

        -- WhichKey
        -- :h which-key.nvim-which-key-colors
        WhichKey = { fg = c.primary },
        WhichKeyGroup = { fg = c.green },
        WhichKeyDesc = { fg = c.fg },

        -- GitSigns
        -- :h gitsigns-highlight-groups
        GitSignsAdd = { fg = c.diff.add },
        GitSignsChange = { fg = c.diff.change },
        GitSignsDelete = { fg = c.diff.delete },

        -- Telescope
        TelescopeNormal = { fg = c.fg, bg = c.float.bg },
        TelescopeBorder = { fg = c.float.border, bg = c.float.bg },
        TelescopeTitle = { fg = c.float.title, bg = c.float.bg },
        TelescopeMatching = { fg = c.match, bold = opts.bold },

        -- NvimTree
        -- :h nvim-tree-highlight
        NvimTreeRootFolder = { fg = c.blue, bold = opts.bold },
        NvimTreeSymlink = { fg = c.cyan },
        NvimTreeWindowPicker = { fg = c.primary, bg = c.line, bold = opts.bold },
        NvimTreeIndentMarker = { link = "NonText" },
        NvimTreeGitDirty = { fg = c.diff.change },
        NvimTreeGitStaged = { fg = c.diff.add },
        NvimTreeGitMerge = { fg = c.dull_yellow },
        NvimTreeGitRenamed = { fg = c.diff.change },
        NvimTreeGitNew = { fg = c.diff.add },
        NvimTreeGitDeleted = { fg = c.diff.delete },
        NvimTreeGitIgnored = { fg = c.white },

        -- Dashboard
        -- :h dashboard-configuration-theme-config
        DashboardHeader = { fg = c.primary },
        DashboardFooter = { fg = c.primary },

        -- BufferLine
        BufferLineIndicatorSelected = { fg = c.primary },
        BufferLineOffsetSeparator = { link = "WinSeparator" },

        -- Cmp
        -- :h cmp-highlight
        CmpItemAbbr = { fg = c.fg, bg = c.none },
        CmpItemAbbrDeprecated = { fg = c.fg_soft, bg = c.none, strikethrough = opts.strikethrough },
        CmpItemAbbrMatch = { fg = c.match, bold = opts.bold },
        CmpItemAbbrMatchFuzzy = { sp = c.match, undercurl = opts.undercurl },
        CmpItemMenu = { fg = c.fg_soft, bg = c.none },

        -- Navic
        -- :h navic-highlights
        NavicSeparator = { fg = c.fg },
        NavicText = { fg = c.fg },

        -- Illuminate
        -- :h illuminate-highlight-groups
        IlluminatedWordText = { link = "LspReferenceText" },
        IlluminatedWordRead = { link = "LspReferenceRead" },
        IlluminatedWordWrite = { link = "LspReferenceWrite" },

    -- Hide all semantic highlights
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
    end

    -- Cmp and Navic
    -- :h navic-highlights
    -- :h cmp-highlight
    -- {{{
    -- stylua: ignore start
    local kinds = {
        Array           = "@punctuation.bracket",
        Boolean         = "@boolean",
        Class           = "@type",
        Color           = "Special",
        Constant        = "@constant",
        Constructor     = "@constructor",
        Enum            = "Structure",
        EnumMember      = "Constant",
        Event           = "Special",
        Field           = "@field",
        File            = "Normal",
        Folder          = "Directory",
        Function        = "@function",
        Interface       = "Structure",
        Key             = "@field",
        Keyword         = "@keyword",
        Method          = "@method",
        Module          = "@namespace",
        Namespace       = "@namespace",
        Null            = "@constant.builtin",
        Number          = "@number",
        Object          = "@constant",
        Operator        = "@operator",
        Package         = "@namespace",
        Property        = "@property",
        Reference       = "@text.reference",
        Snippet         = "Conceal",
        String          = "@string",
        Struct          = "Structure",
        Text            = "@text",
        TypeParameter   = "TypeDef",
        Unit            = "Structure",
        Value           = "@string",
        Variable        = "@variable",
    }
    -- stylua: ignore end

    local kind_groups = { "NavicIcons%s", "CmpItemKind%s" }

    for kind, link in pairs(kinds) do
        for _, plugin in pairs(kind_groups) do
            highlights[plugin:format(kind)] = { link = link }
        end
    end
    -- }}}

    -- Terminal
    if opts.terminal_colors then
        -- stylua: ignore start
        local term_colors = {
            c.bg,               -- color0     Black
            c.red,              -- color1     Red
            c.green,            -- color2     Green
            c.yellow,           -- color3     Yellow
            c.blue,             -- color4     Blue
            c.magenta,          -- color5     Magenta
            c.cyan,             -- color6     Cyan
            c.fg,               -- color7     White

            c.bg_soft,          -- color8     BrightBlack
            c.bright_red,       -- color9     BrightRed
            c.bright_green,     -- color10    BrightGreen
            c.bright_yellow,    -- color11    BrightYellow
            c.bright_blue,      -- color12    BrightBlue
            c.bright_magenta,   -- color13    BrightMagenta
            c.bright_cyan,      -- color14    BrightCyan
            c.fg_hard,          -- color15    BrightWhite
        }
        -- stylua: ignore end

        for index, value in ipairs(term_colors) do
            vim.g["terminal_color_" .. index - 1] = value
        end
    end

    -- Override specific highlights
    opts.overrides(highlights, c)

    return highlights
end

return M
