return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.cmake_format,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.diagnostics.cmake_lint,
                null_ls.builtins.completion.tags,
                null_ls.builtins.completion.luasnip,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.verible_verilog_format,
                null_ls.builtins.formatting.asmfmt,
            },
        })
        vim.keymap.set("n", "<leader>gf", function()
            local supported_filetypes = { "cpp", "c", "python", "lua", "systemverilog", "v"}
            local function is_supported_filetype(filetype)
                for _, ft in ipairs(supported_filetypes) do
                    if ft == filetype then
                        return true
                    end
                end
                return false
            end
            local filetype = vim.bo.filetype
            if is_supported_filetype(filetype) then
                vim.lsp.buf.format({ timeout_ms = 2000 })
            else
                print("No formatting available for this file type")
            end
        end, { noremap = true, silent = true })
    end,
}
