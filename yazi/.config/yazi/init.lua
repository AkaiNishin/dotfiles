return {
    require("full-border"):setup(),
    require("git"):setup(),
    require("projects"):setup({
        save = {
            method = "yazi", -- yazi | lua
            lua_save_path = "~/.config/yazi/state/projects.json"
        },
        last = {
            update_after_save = true,
            update_after_load = true,
        },
        merge = {
            quit_after_merge = false,
        },
        notify = {
            enable = true,
            title = "Projects",
            timeout = 3,
            level = "info",
        },
    })
}

