local present, lualine = pcall(require, "lualine")

if not present then
    return
end

-- options { default , arrow , round , block █ }--------v
local sep = require('plugins/icons').statusline_separators.round

lualine.setup {
    options = {
        section_separators = { left = sep.left, right = sep.right },
        component_separators = { left = sep.left_sep, right = sep.right_sep }
    },

    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { { 'branch', icon = '' }, 'diff' },
        lualine_y = {
            {
                'filetype',
                -- Display only an icon for filetype
                icon_only = true,
                -- Display filetype icon on the right hand side
                icon = { align = 'right' },
            }
        },
        lualine_x = {
            {
                'diagnostics',
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                -- Displays diagnostics status in color if set to true.
                colored = true,
            }
        },
        lualine_z = {}
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
                    -- Color for active buffer.
                    active = 'lualine_a_normal',
                    -- Color for inactive buffer.
                    inactive = 'lualine_b_normal',
                },

                symbols = {
                    -- Text to show when the buffer is modified
                    modified = ' ', --' ●',
                    -- Text to show to identify the alternate file
                    alternate_file = '',
                    -- Text to show when the buffer is a directory
                    directory = ' ',
                },
            }
        },

        lualine_x = {},
        lualine_y = { 'searchcount' },
        lualine_z = { '[[[%l|%L] ]]' } --'tabs' }
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}



vim.g.indent_blankline_char = '▏'
