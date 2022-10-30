-- neo-tree setup
require('neo-tree').setup({
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = false,
    window = {
        width = 35,
        position = 'left',
    },
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
        }
    },
    sources = {
        'filesystem',
        'buffers',
        'git_status',
    },
    sourse_selector = {
        winbar = false,
        statusline = true,
        tab_labels = { -- falls back to source_name if nil
            filesystem = "  Files ",
            buffers = "  Buffers ",
            git_status = "  Git ",
        },
    },
})
