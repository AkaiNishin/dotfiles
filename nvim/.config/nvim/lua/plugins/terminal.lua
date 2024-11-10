return {
    'nyngwang/NeoTerm.lua',
    config = function()
        require('neo-term').setup {
            exclude_filetypes = { 'oil' },
            -- exclude_buftypes = {}, -- 'terminal' will always be added by NeoTerm.lua
            -- enabled by default!
            -- presets = {
            --   'vim-test',
            -- }
        }
        vim.keymap.set('n', '<C-Return>', function() vim.cmd('NeoTermToggle') end)
        vim.keymap.set('t', '<C-Return>', function() vim.cmd('NeoTermEnterNormal') end)
    end
}
