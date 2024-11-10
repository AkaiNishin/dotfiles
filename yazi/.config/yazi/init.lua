return {
    require("full-border"):setup(),
    require("git"):setup(),
    require("simple-mtpfs"):setup({}),
   require("yamb"):setup({
        -- Optional, the path ending with path seperator represents folder.
        bookmarks = bookmarks,
        -- Optional, recieve notification everytime you jump.
        jump_notify = true,
        -- Optional, the cli of fzf.
        cli = "fzf",
        -- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
        keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
        -- Optional, the path of bookmarks
        path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark") or 
            (os.getenv("HOME") .. "/.config/yazi/bookmark"),
    })
}

