local utils = require("hybrid.utils")

local M = {}

function M.setup(opts)
    local c = require("hybrid.colors").setup()

    local highlights = {
        -- Highlight default
        -- :h highlight-default
        ColorColumn = { bg = c.bg_hard },
        Conceal = { fg = c.primary },
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
        IncSearch = { fg = c.orange, bg = c.bg, reverse = opts.inverse },
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
        Visual = { bg = c.selection },
        VisualNOS = { link = "Visual" },
        WarningMsg = { fg = c.diag.warning },
        Whitespace = { link = "NonText" },
        WildMenu = { fg = c.fg, bg = c.selection, bold = opts.bold },
        WinBar = { fg = c.fg, bg = c.bg },
        WinBarNC = { fg = c.fg, bg = c.bg },

        -- Syntax highlighting
        -- :h group-name
        Comment = { fg = c.comment, italic = opts.italic.comments },
        Constant = { fg = c.orange },
        String = { fg = c.green, italic = opts.italic.strings },
        Character = { fg = c.green },
        -- Number = {},
        -- Boolean = {},
        -- Float = {},
        Identifier = { fg = c.magenta },
        Function = { fg = c.blue },
        Statement = { fg = c.magenta },
        -- Conditional = {},
        -- Repeat = {},
        -- Label = {},
        Operator = { fg = c.blue },
        Keyword = { fg = c.cyan },
        -- Exception = {},
        PreProc = { fg = c.cyan },
        -- Include = {},
        -- Define = {},
        -- Macro = {},
        -- PreCondit = {},
        Type = { fg = c.bright_cyan },
        -- StorageClass = {},
        -- Structure = {},
        -- Typedef = {},
        Special = { fg = c.cyan },
        -- SpecialChar = {},
        -- Tag = {},
        -- Delimiter = {},
        -- SpecialComment = {},
        Debug = { fg = c.orange },
        Underlined = { underline = opts.underline },
        Ignore = { link = "NonText" },
        Error = { fg = c.diag.error, reverse = opts.inverse },
        Todo = { fg = c.diag.hint, reverse = opts.inverse }, -- TODO FIXME XXX

        -- Treesitter
        -- Misc {{{
        -- @comment (Comment)                          ; line and block comments
        -- @error                                      ; syntax/parser errors
        -- @none                                       ; completely disable the highlight
        ["@none"] = { fg = c.none, bg = c.none },
        -- @preproc (PreProc)                          ; various preprocessor directives & shebangs
        -- @define (Define)                            ; preprocessor definition directives
        -- @operator (Operator)                        ; symbolic operators (e.g. `+` / `*`)
        ["@operator"] = { link = "Operator" },

        -- Punctuation (Delimiter)
        -- @punctuation.delimiter                      ; delimiters (e.g. ` ; ` / `.` / `,`)
        ["@punctuation.delimiter"] = { fg = c.bright_blue },
        -- @punctuation.bracket                        ; brackets (e.g. `()` / `{}` / `[]`)
        ["@punctuation.bracket"] = { fg = c.fg },
        -- @punctuation.special                        ; special symbols (e.g. `{}` in string interpolation)
        ["@punctuation.special"] = { fg = c.bright_blue },
        -- }}}

        -- Literals {{{
        -- @string (String)                            ; string literals
        -- @string.regex                               ; regular expressions
        ["@string.regex"] = { fg = c.yellow },
        -- @string.escape (SpecialChar)                ; escape sequences
        ["@string.escape"] = { fg = c.magenta },
        -- @string.special (SpecialChar)               ; other special strings (e.g. dates)

        -- @character (Character)                      ; character literals
        -- @character.special (Special)                ; special characters (e.g. wildcards)

        -- @boolean (Boolean)                          ; boolean literals
        -- @number (Number)                            ; numeric literals
        -- @float (Float)                              ; floating-point number literals
        -- }}}

        -- Functions {{{
        -- @function (Function)                        ; function definitions
        -- @function.builtin (Special)                 ; built-in functions
        -- @function.call                              ; function calls
        -- @function.macro (Macro)                     ; preprocessor macros

        -- @method (Function)                          ; method definitions
        -- @method.call                                ; method calls

        -- @constructor (Special)                      ; constructor calls and definitions
        ["@constructor"] = { fg = c.magenta },
        -- @parameter (Identifier)                     ; parameters of a function
        ["@parameter"] = { fg = c.yellow },
        -- }}}

        -- Keywords (Keyword) {{{
        -- @keyword                                    ; various keywords
        -- @keyword.function                           ; keywords that define a function (e.g. `func` in Go, `def` in Python)
        -- @keyword.operator                           ; operators that are English words (e.g. `and` / `or`)
        -- @keyword.return                             ; keywords like `return` and `yield`

        -- @conditional (Conditional -> Statement)     ; keywords related to conditionals (e.g. `if` / `else`)
        -- @conditional.ternary                        ; Ternary operator: condition ? 1 : 2
        -- @repeat (Repeat)                            ; keywords related to loops (e.g. `for` / `while`)
        -- @debug (Debug)                              ; keywords related to debugging
        -- @label (Label)                              ; GOTO and other labels (e.g. `label:` in C)
        -- @include (Include)                          ; keywords for including modules (e.g. `import` / `from` in Python)
        -- @exception (Exception)                      ; keywords related to exceptions (e.g. `throw` / `catch`)
        ["@label"] = { fg = c.blue },
        -- }}}

        -- Types {{{
        -- @type (Type)                                ; type or class definitions and annotations
        -- @type.builtin                               ; built-in types
        ["@type.builtin"] = { fg = utils.darken(c.blue, 0.8) },
        -- @type.definition (TypeDef)                  ; type definitions (e.g. `typedef` in C)
        -- @type.qualifier                             ; type qualifiers (e.g. `const`)

        -- @structure (Structure)

        -- @storageclass (StorageClass)                ; modifiers that affect storage in memory or life-time
        -- @attribute                                  ; attribute annotations (e.g. Python decorators)
        -- @field (Identifier)                         ; object and struct fields
        ["@field"] = { fg = c.green },
        -- @property (Identifier)                      ; similar to `@field`
        ["@property"] = { fg = c.green },
        -- }}}

        --Identifiers {{{
        -- @variable (Identifier)                      ; various variable names
        ["@variable"] = { fg = c.fg },
        -- @variable.builtin                           ; built-in variable names (e.g. `this`)
        ["@variable.builtin"] = { fg = c.red, italic = true },

        -- @constant (Constant)                        ; constant identifiers
        -- @constant.builtin (Special)                 ; built-in constant values
        -- @constant.macro (Define -> PreProc)         ; constants defined by the preprocessor

        -- @namespace (Identifier)                     ; modules or namespaces
        ["@namespace"] = { link = "Include" },
        ["@namespace.builtin"] = { fg = c.red },
        -- @symbol                                     ; symbols or atoms
        -- }}}

        -- Text {{{
        -- @text                                       ; non-structured text
        -- @text.strong                                ; bold text
        -- @text.emphasis                              ; text with emphasis
        ["@text.emphasis"] = { italic = opts.italic.emphasis },
        -- @text.underline (Underlined)                ; underlined text
        -- @text.strike                                ; strikethrough text
        -- @text.title (Title)                         ; text that is part of a title
        -- @text.literal (Comment)                     ; literal or verbatim text (e.g., inline code)
        ["@text.literal.block.markdown"] = { fg = c.green },
        -- @text.quote                                 ; text quotations
        -- @text.uri (Underlined)                      ; URIs (e.g. hyperlinks)
        -- @text.math                                  ; math environments (e.g. `$ ... $` in LaTeX)
        -- @text.environment                           ; text environments of markup languages
        -- @text.environment.name                      ; text indicating the type of an environment
        -- @text.reference (Identifier)                ; text references, footnotes, citations, etc.
        ["@text.reference"] = { fg = c.bright_cyan },

        -- @text.todo (Todo)                           ; TODO notes
        ["@text.todo"] = { fg = c.diag.hint, reverse = opts.inverse },
        ["@text.todo.unchecked"] = { fg = c.blue },
        ["@text.todo.checked"] = { fg = c.green },
        -- @text.note                                  ; INFO notes
        ["@text.note"] = { fg = c.diag.info, reverse = opts.inverse },
        -- @text.warning                               ; WARNING notes
        ["@text.warning"] = { fg = c.diag.warning, reverse = opts.inverse },
        -- @text.danger                                ; ERROR notes
        ["@text.danger"] = { fg = c.diag.error, reverse = opts.inverse },

        -- @text.diff.add                              ; added text (for diff files)
        ["@text.diff.add"] = { link = "DiffAdd" },
        -- @text.diff.delete                           ; deleted text (for diff files)
        ["@text.diff.delete"] = { link = "DiffDelete" },
        -- }}}

        -- Tags (Tag) {{{
        -- @tag                                        ; XML tag names
        -- @tag.attribute                              ; XML tag attributes
        -- @tag.delimiter                              ; XML tag delimiter
        -- }}}

        -- LSP Semantic Token Groups
        ["@lsp.type.boolean"] = { link = "@boolean" },
        ["@lsp.type.builtinType"] = { link = "@type.builtin" },
        ["@lsp.type.comment"] = { link = "@none" },
        ["@lsp.type.decorator"] = { link = "@attribute" },
        ["@lsp.type.deriveHelper"] = { link = "@attribute" },
        ["@lsp.type.enum"] = { link = "@type" },
        ["@lsp.type.enumMember"] = { link = "@constant" },
        ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
        ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
        ["@lsp.type.generic"] = { link = "@variable" },
        ["@lsp.type.interface"] = { fg = utils.lighten(c.blue, 0.7) },
        ["@lsp.type.keyword"] = { link = "@keyword" },
        ["@lsp.type.lifetime"] = { link = "@storageclass" },
        ["@lsp.type.namespace"] = { link = "@namespace" },
        ["@lsp.type.number"] = { link = "@number" },
        ["@lsp.type.operator"] = { link = "@operator" },
        ["@lsp.type.parameter"] = { link = "@parameter" },
        ["@lsp.type.property"] = { link = "@property" },
        ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
        ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
        ["@lsp.type.string"] = { link = "@string" },
        ["@lsp.type.typeAlias"] = { link = "@type.definition" },
        ["@lsp.type.unresolvedReference"] = { undercurl = opts.undercurl, sp = c.error },
        ["@lsp.type.variable"] = { link = "@variable" },
        ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
        ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
        ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
        ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
        ["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
        ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.operator.injected"] = { link = "@operator" },
        ["@lsp.typemod.string.injected"] = { link = "@string" },
        ["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
        ["@lsp.typemod.type.defaultLibrary"] = { fg = utils.darken(c.blue, 0.8) },
        ["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = utils.darken(c.blue, 0.8) },
        ["@lsp.typemod.variable.callable"] = { link = "@function" },
        ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
        ["@lsp.typemod.variable.injected"] = { link = "@variable" },
        ["@lsp.typemod.variable.static"] = { link = "@constant" },

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

        -- LSP highlight
        -- :h lsp-highlight
        LspReferenceRead = { bg = c.selection, bold = opts.bold },
        LspReferenceText = { bg = c.selection, bold = opts.bold },
        LspReferenceWrite = { bg = c.selection, bold = opts.bold },
        LspSignatureActiveParameter = { link = "Visual" },

        -- Lspconfig
        -- :h lspconfig-highlight
        LspInfoBorder = { link = "FloatBorder" },

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
        NvimTreeGitMerge = { fg = c.orange },
        NvimTreeGitRenamed = { fg = c.diff.change },
        NvimTreeGitNew = { fg = c.diff.add },
        NvimTreeGitDeleted = { fg = c.diff.delete },
        NvimTreeGitIgnored = { fg = c.white },

        -- Dashboard
        -- :h dashboard-configuration-theme-config
        DashboardHeader = { fg = c.primary },
        DashboardFooter = { fg = c.primary },

        -- BufferLine
        BufferLineIndicatorSelected = { fg = c.float.border },
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
    }

    -- Cmp and Navic
    -- :h navic-highlights
    -- :h cmp-highlight

    -- stylua: ignore start
    local kinds = {
        Array           = "@punctuation.bracket",
        Boolean         = "@boolean",
        Class           = "@type",
        Color           = "Special",
        Constant        = "@constant",
        Constructor     = "@constructor",
        Enum            = "@lsp.type.enum",
        EnumMember      = "@lsp.type.enumMember",
        Event           = "Special",
        Field           = "@field",
        File            = "Normal",
        Folder          = "Directory",
        Function        = "@function",
        Interface       = "@lsp.type.interface",
        Key             = "@field",
        Keyword         = "@lsp.type.keyword",
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
        Struct          = "@lsp.type.struct",
        Text            = "@text",
        TypeParameter   = "@lsp.type.typeParameter",
        Unit            = "@lsp.type.struct",
        Value           = "@string",
        Variable        = "@variable",
    }
    -- stylua: ignore end

    local kind_groups = { "NavicIcons%s", "CmpItemKind%s" }

    for kind, link in pairs(kinds) do
        local base = "LspKind" .. kind
        highlights[base] = { link = link }
        for _, plugin in pairs(kind_groups) do
            highlights[plugin:format(kind)] = { link = base }
        end
    end

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
