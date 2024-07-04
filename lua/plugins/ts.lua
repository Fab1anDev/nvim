return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { {'nvim-lua/plenary.nvim'} },
        config = function ()
            local telescope = require('telescope')

            telescope.setup {
                defaults = {
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case'
                    },
                    prompt_prefix = "🔍 ",
                    selection_caret = "➤ ",
                    entry_prefix = "  ",
                    initial_mode = "insert",
                    selection_strategy = "reset",
                    sorting_strategy = "descending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            mirror = false,
                            preview_width = 0.6,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.75,
                        height = 0.85,
                        preview_cutoff = 120,
                    },
                    file_sorter = require'telescope.sorters'.get_fuzzy_file,
                    file_ignore_patterns = {"node_modules", ".git/"},
                    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
                    path_display = {"truncate"},
                    winblend = 0,
                    border = {},
                    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
                    color_devicons = true,
                    use_less = true,
                    set_env = { ['COLORTERM'] = 'truecolor' },
                    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
                    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
                    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
                    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                    },
                    live_grep = {
                        theme = "ivy",
                    },
                    buffers = {
                        theme = "dropdown",
                        previewer = false,
                    },
                    help_tags = {
                        theme = "dropdown",
                    },
                },
                extensions = {
                    -- Erweiterungen können hier konfiguriert werden
                },
            }

            -- Keybindings für Telescope
            vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true, silent = true })       
        end
    },
}
