# Author: Shafkath Shuhan <shafkathshuhannyc@gmail.com>

"namespace" = { fg = "type" }
"module" = { fg = "type" }

"type" = { fg = "type" }
"type.builtin" = { fg = "type" }
"type.enum.variant" = { fg = "constant" }
"constructor" = { fg = "type" }
"variable.other.member" = { fg = "variable" }

"keyword" = { fg = "blue2" }
"keyword.directive" = { fg = "blue2" }
"keyword.control" = { fg = "special" }
"label" = { fg = "blue2" }
"tag" = "blue2"

"special" = { fg = "text" }
"operator" = { fg = "text" }

"punctuation" = { fg = "text" }
"punctuation.delimiter" = { fg = "text" }

"variable" = { fg = "variable" }
"variable.parameter" = { fg = "variable" }
"variable.builtin" = { fg = "blue2" }
"constant" = { fg = "constant" }
"constant.builtin" = { fg = "blue2" }

"function" = { fg = "fn_declaration" }
"function.builtin" = { fg = "fn_declaration" }
"function.macro" = { fg = "blue2" }
"attribute" = { fg = "fn_declaration" }

"comment" = { fg = "dark_gray" }

"string" = { fg = "orange" }
"constant.character" = { fg = "orange" }
"string.regexp" = { fg = "gold" }
"constant.numeric" = { fg = "pale_green" }
"constant.character.escape" = { fg = "gold" }

"markup.heading" = { fg = "blue2", modifiers = ["bold"] }
"markup.list" = "blue3"
"markup.bold" = { fg = "blue2", modifiers = ["bold"] }
"markup.italic" = { modifiers = ["italic"] }
"markup.link.url" = { modifiers = ["underlined"] }
"markup.link.text" = "orange"
"markup.quote" = "dark_green"
"markup.raw" = "orange"

"diff.plus" = { fg = "pale_green" }
"diff.delta" = { fg = "gold" }
"diff.minus" = { fg = "red" }

"ui.background" = { fg = "light_gray", bg = "dark_gray2" }

"ui.window" = { bg = "widget" }
"ui.popup" = { fg = "text", bg = "widget" }
"ui.help" = { fg = "text", bg = "widget" }
"ui.menu" = { fg = "text", bg = "widget" }
"ui.menu.selected" = { bg = "dark_blue2" }

# TODO: Alternate bg colour for `ui.cursor.match` and `ui.selection`.
"ui.cursor" = { fg = "cursor", modifiers = ["reversed"] }
"ui.cursor.primary" = { fg = "cursor", modifiers = ["reversed"] }
"ui.cursor.match" = { bg = "#3a3d41" }

"ui.selection" = { bg = "#3a3d41" }
"ui.selection.primary" = { bg = "dark_blue" }

"ui.linenr" = { fg = "dark_gray" }
"ui.linenr.selected" = { fg = "light_gray2" }

"ui.cursorline.primary" = { bg = "dark_gray3" }
"ui.statusline" = { fg = "white", bg = "dark_gray4" }
"ui.statusline.inactive" = { fg = "white", bg = "dark_gray3" }
"ui.statusline.normal" = { fg = "white", bg = "dark_green" }
"ui.statusline.insert" = { fg = "white", bg = "blue" }
"ui.statusline.select" = { fg = "white", bg = "dark_purple" }

"ui.text" = { fg = "text" }
"ui.text.focus" = { fg = "white" }

"ui.virtual.whitespace" = { fg = "dark_gray" }
"ui.virtual.ruler" = { bg = "borders" }
"ui.virtual.indent-guide" = { fg = "dark_gray4" }

"warning" = { fg = "gold2" }
"error" = { fg = "red" }
"info" = { fg = "light_blue" }
"hint" = { fg = "light_gray3" }

diagnostic = { modifiers = ["underlined"] }

[palette]
orange = "#ce9178"

gold = "#d7ba7d"
gold2 = "#cca700"

pale_green = "#6A9955"
dark_green = "#b5cea8"

white = "#ffffff"
light_gray3 ="#1c1c1c"
light_gray = "#282828"
light_gray2 = "#404040"
dark_gray = "#858585"
dark_gray4 = "#c6c6c6"
dark_gray3 = "#d4d4d4"
dark_gray2 =  "#eeeeee"

light_blue = "#094771"
blue2 = "#264f78"
blue = "#6796E6"
blue3 = "#007acc"
dark_blue = "#569CD6"
dark_blue2 = "#62A0EA"

purple = "#9141AC"
dark_purple = "#C061CB"

red = "#ED333B"

type = "#2EC27E"
special = "#C586C0"
variable = "#2C3C6E"
fn_declaration = "#DCDCAA"
constant = "#4FC1FF"

background = "#ffffff"
text = "#1e1e1e"
cursor = "#363636"
widget = "#d5d5d6"
borders = "#f2f2d2"
