return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    keys = {
        {'<C-b>', ':NvimTreeToggle<CR>', silent = true},
        {'<C-i>', ':NvimTreeFindFile<CR>', silent = true}
    },
    opts = {
        hijack_directories = {enable = false},
        actions = {
            open_file = {quit_on_open = true},
            change_dir = {enable = false, global = false}
        },
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        sync_root_with_cwd = true,
        diagnostics = {enable = true, show_on_dirs = true},
        filters = {custom = {'^.git$'}},
        update_focused_file = {enable = true, update_root = true},
        view = {width = 50}
    }
}
