local present, lualine = pcall(require, "lualine")

if not present then
    return
end

-- options { default , arrow , round , block █ },
local sep = require('icons').statusline_separators.round

lualine.setup {
    options = {
        section_separators = { left = sep.left, right = sep.right },
        component_separators = { left = sep.left_sep, right = sep.right_sep }
    },

    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { { 'branch', icon = '' } },
        lualine_x = {
            {
                'filetype',
                icon_only = true, -- Display only an icon for filetype
                icon = { align = 'right' }, -- Display filetype icon on the right hand side
            }
        },
        lualine_y = { 'progress' },
        lualine_z = { '%l|%L' }
    },

    tabline = {
        lualine_c = {},
        lualine_b = {},
        lualine_a = {
            {
                'buffers',
                hide_filename_extension = true,

                buffers_color = {
                    -- Same values as the general color option can be used here.
                    active = 'lualine_a_normal', -- Color for active buffer.
                    inactive = 'lualine_b_normal', -- Color for inactive buffer.
                },

                symbols = {
                    -- modified = ' ●', -- Text to show when the buffer is modified
                    alternate_file = '', -- Text to show to identify the alternate file
                    directory = ' ', -- Text to show when the buffer is a directory
                },
            }
        },

        lualine_x = { 'diff' },
        lualine_y = {
            {
                'diagnostics',
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                colored = true, -- Displays diagnostics status in color if set to true.
            }
        },
        lualine_z = {} --'tabs' }
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
}



vim.g.indent_blankline_char = '▏'
