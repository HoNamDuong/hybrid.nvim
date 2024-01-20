local c = require("hybrid.colors").setup()

local M = {
    -- stylua: ignore start
    normal                  = { fg = c.fg                         },

    ellipsis                = { fg = c.fg                         },
    separator               = { fg = c.fg                         },
    modified                = { fg = c.fg                         },

    dirname                 = { link = "Directory"                },
    basename                = { fg = c.fg                         },
    context                 = { fg = c.fg                         },

    context_array           = { link = "CmpItemKindArray"         },
    context_boolean         = { link = "CmpItemKindBoolean"       },
    context_class           = { link = "CmpItemKindClass"         },
    context_constant        = { link = "CmpItemKindConstant"      },
    context_constructor     = { link = "CmpItemKindConstructor"   },
    context_enum            = { link = "CmpItemKindEnum"          },
    context_enum_member     = { link = "CmpItemKindEnumMember"    },
    context_event           = { link = "CmpItemKindEvent"         },
    context_field           = { link = "CmpItemKindField"         },
    context_file            = { link = "CmpItemKindFile"          },
    context_function        = { link = "CmpItemKindFunction"      },
    context_interface       = { link = "CmpItemKindInterface"     },
    context_key             = { link = "CmpItemKindKey"           },
    context_method          = { link = "CmpItemKindMethod"        },
    context_module          = { link = "CmpItemKindModule"        },
    context_namespace       = { link = "CmpItemKindNamespace"     },
    context_null            = { link = "CmpItemKindNull"          },
    context_number          = { link = "CmpItemKindNumber"        },
    context_object          = { link = "CmpItemKindObject"        },
    context_operator        = { link = "CmpItemKindOperator"      },
    context_package         = { link = "CmpItemKindPackage"       },
    context_property        = { link = "CmpItemKindProperty"      },
    context_string          = { link = "CmpItemKindString"        },
    context_struct          = { link = "CmpItemKindStruct"        },
    context_type_parameter  = { link = "CmpItemKindTypeParameter" },
    context_variable        = { link = "CmpItemKindVariable"      },
    -- stylua: ignore end
}

return M
