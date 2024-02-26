local opt = vim.opt

opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0

-- Popup menu in cmd completion
opt.wildoptions = "pum"
opt.pumblend = 5


-- vim.cmd("colorscheme kanagawa");
-- vim.cmd("colorscheme darcula-solid");
-- vim.cmd("colorscheme darcula");

-- color names are taken from here: https://www.color-name.com/

local default = {
  topaz = "#FFC66D",
  bronze = "#CC7832",
  cadet_blue = "#A9B7C6",
  axolotl = "#6A8759",
  cerulean_frost1 = "#6897BB",
  cerulean_frost2 = "#6D9CBE",
  gray = "#808080", -- used for comments
  purple_mountain_majesty = "#9876AA",
  russian_green = "#629755",
  bud_green = "#77B767",
  coyote_brown = "#8A653B",
  acid_green = "#BBB529",
  hookers_green = "#507874",
  middle_yellow_red = "#E8BF6A",
  middle_green_yellow = "#A5C261",
  gray_x11 = "#BABABA",
  light_sea_green = "#26BDA4",
  charleston_green = "#2B2B2B", -- used for background
  gitSigns = {
    add = "#384C38",
    change = "#374752",
    -- NOTE(danil): not sure about this color
    delete = "#4C393A",
  },
}

local c = default;
local syntax = {
  -- *Comment	any comment
  Comment = { fg = c.gray },

  -- *Constant	any constant 1, "hello", true, etc
  Constant = { fg = c.cadet_blue },
  --  String		a string constant: "this is a string"
  String = { fg = c.axolotl },
  --  Character	a character constant: 'c', '\n'
  Character = { link = "String" },
  --  Number		a number constant: 234, 0xff
  Number = { fg = c.cerulean_frost1 },
  --  Boolean	a boolean constant: TRUE, false
  Boolean = { fg = c.bronze, bold = false},
  --  Float		a floating point constant: 2.3e10
  Float = { link = "Number" },

  -- *Identifier	any variable name
  Identifier = { fg = c.cadet_blue },
  --  Function	function name (also: methods for classes)
  Function = { fg = c.topaz },

  -- *Statement	any statement
  Statement = { fg = c.bronze },
  --  Conditional	if, then, else, endif, switch, etc.
  --  Repeat		for, do, while, etc.
  --  Label		case, default, etc.
  --  Operator	"sizeof", "+", "*", etc.
  Operator = { fg = c.cadet_blue },
  --  Keyword	any other keyword
  Keyword = { fg = c.bronze },
  --  Exception	try, catch, throw
  Exception = { fg = c.bronze },

  -- TODO(danil): add preproc the same as in CLion
  -- *PreProc	generic Preprocessor
  -- PreProc = { fg = theme.syn.preproc },
  --  Include	preprocessor #include
  --  Define		preprocessor #define
  --  Macro		same as Define
  --  PreCondit	preprocessor #if, #else, #endif, etc.

  -- *Type		int, long, char, etc.
  Type = { fg = c.bronze, bold = false },
  --  StorageClass	static, register, volatile, etc.
  -- Structure	struct, union, enum, etc.
  Structure = { fg = c.cadet_blue, bold = false },
  --  Typedef	A typedef

  -- *Special	any special symbol
  -- Special = { fg = theme.syn.special1 },
  --  SpecialChar	special character in a constant
  --  Tag		you can use CTRL-] on this
  --  Delimiter	character that needs attention
  Delimiter = { fg = c.cadet_blue },
  --  SpecialComment	special things inside a comment
  --  Debug		debugging statements

  -- *Underlined	text that stands out, HTML links
  Underlined = { underline = true },
  Bold = { bold = true },
  Italic = { italic = true },

  -- TODO(danil): have a look at this
  -- *Ignore		left blank, hidden  |hl-Ignore|
  -- Ignore = { link = "NonText" },

  -- *Error		any erroneous construct
  -- Error = { fg = theme.diag.error },

  -- *Todo		anything that needs extra attention; mostly the keywords TODO FIXME WARNING and XXX
  Todo = { link = "Comment" },

  qfLineNr = { link = "lineNr" },
  qfFileName = { link = "Directory" },

  -- htmlH1 = {},
  -- htmlH2 = {},

  -- mkdHeading = {},
  -- mkdCode = {},
  -- mkdCodeDelimiter = {},
  -- mkdCodeStart = {},
  -- mkdCodeEnd = {},
  -- mkdLink = {},

  -- markdownHeadingDelimiter = {},
  markdownCode = { fg = c.axolotl },
  markdownCodeBlock = { fg = c.axolotl },
  markdownEscape = { fg = "NONE" },
  -- markdownH1 = {},
  -- markdownH2 = {},
  -- markdownLinkText = {},
}

local treesitter = {
  -- Misc {{{
  -- @comment (Comment)                          ; line and block comments
  -- @error                                      ; syntax/parser errors
  -- @none                                       ; completely disable the highlight
  -- @preproc (PreProc)                          ; various preprocessor directives & shebangs
  -- @define (Define)                            ; preprocessor definition directives
  -- @operator (Operator)                        ; symbolic operators (e.g. `+` / `*`)
  ["@operator"] = { fg = c.cadet_blue },

  -- TODO(danil): bronze color for comma
  -- Punctuation (Delimiter)
  -- @punctuation.delimiter                      ; delimiters (e.g. ` ; ` / `.` / `,`)
  ["@punctuation.delimiter"] = { fg = c.cadet_blue },
  -- @punctuation.bracket                        ; brackets (e.g. `()` / `{}` / `[]`)
  ["@punctuation.bracket"] = { fg = c.cadet_blue },
  -- @punctuation.special                        ; special symbols (e.g. `{}` in string interpolation)
  ["@punctuation.special"] = { fg = c.cadet_blue },
  -- }}}

  -- Literals {{{
  -- @string (String)                            ; string literals
  -- @string.regex                               ; regular expressions
  ["@string.regex"] = { fg = c.axolotl },
  -- @string.escape (SpecialChar)                ; escape sequences
  ["@string.escape"] = { fg = c.bronze, bold = false},
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
  -- ["@constructor.lua"] = { fg = theme.syn.keyword },
  -- TODO(danil): constructor call should be white
  ["@constructor"] = { fg = c.bronze },
  -- @parameter (Identifier)                     ; parameters of a function
  -- }}}

  -- Keywords (Keyword) {{{
  -- @keyword                                    ; various keywords
  -- @keyword.function                           ; keywords that define a function (e.g. `func` in Go, `def` in Python)
  -- @keyword.operator                           ; operators that are English words (e.g. `and` / `or`)
  -- @keyword.return                             ; keywords like `return` and `yield`

  -- @conditional (Conditional -> Statement)     ; keywords related to conditionals (e.g. `if` / `else`)
  -- @conditional.ternary                        ; Ternary operator: condition ? 1 : 2
  ["@conditional.ternary"] = { fg = c.cadet_blue },
  -- @repeat (Repeat)                            ; keywords related to loops (e.g. `for` / `while`)
  -- @debug (Debug)                              ; keywords related to debugging
  -- @label (Label)                              ; GOTO and other labels (e.g. `label:` in C)
  -- @include (Include)                          ; keywords for including modules (e.g. `import` / `from` in Python)
  ["@include"] = { fg = c.bronze },
  -- @exception (Exception)                      ; keywords related to exceptions (e.g. `throw` / `catch`)
  -- }}}

  -- Types {{{
  -- @type (Type)                                ; type or class definitions and annotations
  ["@type"] = { fg = c.cadet_blue },
  -- @type.builtin                               ; built-in types
  ["@type.builtin"] = { link = "Type" },
  -- @type.definition (TypeDef)                  ; type definitions (e.g. `typedef` in C)
  -- @type.qualifier                             ; type qualifiers (e.g. `const`)
  ["@type.qualifier"] = { fg = c.bronze },

  -- @structure (Structure)

  -- @storageclass (StorageClass)                ; modifiers that affect storage in memory or life-time
  -- @attribute                                  ; attribute annotations (e.g. Python decorators)
  ["@attribute"] = { fg = c.acid_green },
  -- @field (Identifier)                         ; object and struct fields
  -- @property (Identifier)                      ; similar to `@field`
  ["@property"] = { fg = c.purple_mountain_majesty },
  -- }}}

  --Identifiers {{{
  -- @variable (Identifier)                      ; various variable names
  -- @variable.builtin                           ; built-in variable names (e.g. `this`)
  ["@variable.builtin"] = { fg = c.bronze },

  -- @constant (Constant)                        ; constant identifiers
  ["@constant.builtin"] = { fg = c.bronze }, -- (Special)                 ; built-in constant values
  -- @constant.macro (Define -> PreProc)         ; constants defined by the preprocessor

  -- @namespace (Identifier)                     ; modules or namespaces
  -- @symbol                                     ; symbols or atoms
  -- ["@symbol"] = { fg = theme.syn.identifier },
  -- }}}

  -- Text {{{
  -- @text                                       ; non-structured text
  -- @text.strong                                ; bold text
  ["@text.strong"] = { bold = true },
  -- @text.emphasis                              ; text with emphasis
  ["@text.emphasis"] = { italic = true },
  -- @text.underline (Underlined)                ; underlined text
  -- @text.strike                                ; strikethrough text
  -- @text.title (Title)                         ; text that is part of a title
  ["@text.title"] = { link = "Function" },
  -- @text.literal (Comment)                     ; literal or verbatim text (e.g., inline code)
  ["@text.literal"] = { link = "String" },
  -- @text.quote                                 ; text quotations
  ["@text.quote"] = { link = "@parameter" },
  -- @text.uri (Underlined)                      ; URIs (e.g. hyperlinks)
  -- @text.math                                  ; math environments (e.g. `$ ... $` in LaTeX)
  ["@text.math"] = { link = "Constant" },
  -- @text.environment                           ; text environments of markup languages
  ["@text.environment"] = { link = "Keyword" },
  -- @text.environment.name                      ; text indicating the type of an environment
  ["@text.environment.name"] = { link = "String" },
  -- @text.reference (Identifier)                ; text references, footnotes, citations, etc.

  -- @text.todo (Todo)                           ; todo notes
  -- @text.note                                  ; info notes
  -- ["@text.note"] = { fg = theme.ui.fg_reverse, bg = theme.diag.hint, bold = true },
  -- @text.warning                               ; warning notes
  -- ["@text.warning"] = { fg = theme.ui.fg_reverse, bg = theme.diag.warning, bold = true },
  -- @text.danger                                ; danger/error notes
  -- ["@text.danger"] = { fg = theme.ui.fg, bg = theme.diag.error, bold = true },

  -- @text.diff.add                              ; added text (for diff files)
  -- ['@text.diff.add'] = { fg = theme.vcs.added },
  -- @text.diff.delete                           ; deleted text (for diff files)
  -- ['@text.diff.delete'] = { fg = theme.vcs.removed },
  -- }}}

  -- Tags (Tag) {{{
  -- @tag                                        ; XML tag names
  -- @tag.attribute                              ; XML tag attributes
  -- ["@tag.attribute"] = { fg = theme.syn.identifier },
  -- @tag.delimiter                              ; XML tag delimiter
  -- ["@tag.delimiter"] = { fg = theme.syn.punct },
  -- }}}
  ["@lsp.typemod.variable.global"] = { fg = c.purple_mountain_majesty },
  ["@lsp.type.builtinType"] = { link = "@type.builtin" },
}


-- NOTES: 
-- 1) construcor call colored wrong
-- 2) builtin types colored wrong
-- 3) propertys in construcor colored wron
-- 4) builtin types colored wron
-- 5) commas colored wrong

-- Key:         Ctrl-e
-- Action:      Show treesitter capture group for textobject under cursor.
vim.keymap.set("n",    "<C-e>",
    function()
        local result = vim.treesitter.get_captures_at_cursor(0)
        print(vim.inspect(result))
    end,
    { noremap = true, silent = false }
)

vim.o.termguicolors = true
vim.g.colors_name = "darcula"

function apply(rules)
  for group, color in pairs(rules) do
    vim.api.nvim_set_hl(0, group, color);
  end
end

apply(syntax);
apply(treesitter);




