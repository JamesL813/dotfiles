
local present, lualine = pcall(require, "lualine")

if not present then
    return
end
-- component_separators = { left = '', right = ''},
-- section_separators = { left = '', right = ''},
lualine.setup {
    options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {
                'filename',
                -- file_status = true,      -- Displays file status (readonly status, modified status)
                newfile_status = true,   -- Display new file status (new file means no write after created)
                path = 1,                -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory

                -- shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
              --  symbols = {
              --      modified = '[+]',      -- Text to show when the file is modified.
              --      readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
              --      unnamed = '[No Name]', -- Text to show for unnamed buffers.
              --      newfile = '[New]',     -- Text to show for new created file before first writting
              --  }
            }
        },
        lualine_c = {
            {'branch', icon = ''}, 'diff', 'diagnostics'},
        lualine_x = {
            {
                'filetype',
                colored = true,   -- Displays filetype icon in color if set to true
                icon_only = true, -- Display only an icon for filetype
                icon = { align = 'right' }, -- Display filetype icon on the right hand side
                -- icon =    {'X', align='right'}
                -- Icon string ^ in table is ignored in filetype component
            }
        },
        lualine_y = {'progress'},
        lualine_z = {'%l:%L'}
    },
--    inactive_sections = {
--        lualine_a = {},
--        lualine_b = {},
--        lualine_c = {'filename'},
--        lualine_x = {'location'},
--        lualine_y = {},
--        lualine_z = {}
--    },
 }
