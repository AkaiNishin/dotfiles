return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "cmake",
                    "pylsp",
                    "pyright",
                    "asm_lsp",
                    "svls",
                    "texlab",
                },
                automatic_installation = true, -- Ensure servers are installed
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.pyright.setup({
                capabilities = capabilities,
                settings = {
                    pyright = {
                        python = {
                            analysis = {
                                useLibraryCodeForTypes = true,
                                diagnosticSeverityOverrides = {
                                    reportGeneralTypeIssues = "none",
                                    reportOptionalMemberAccess = "none",
                                    reportOptionalSubscript = "none",
                                    reportPrivateImportUsage = "none",
                                },
                                autoImportCompletions = false,
                            },
                            linting = { pylintEnabled = false }
                        }
                    },
                }
            })

            lspconfig.pylsp.setup({
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        builtin = {
                            installExtraArgs = {
                                'flake8',
                                'pycodestyle',
                                'pydocstyle',
                                'pyflakes',
                                'pylint',
                                'yapf'
                            },
                        },
                        plugins = {
                            jedi_completion = { enabled = false },
                            rope_completion = { enabled = false },
                            flake8 = { enabled = false },
                            pyflakes = { enabled = false },
                            pycodestyle = {
                               maxLineLength = 99,
                            },
                        },
                    },
                }
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    -- Adjust as needed
                    "--compile-commands-dir=build",
                    -- Disable automatic header insertion if it interferes
                    "--header-insertion=never",
                },
            })

            lspconfig.cmake.setup({
                capabilities = capabilities,
            })

            lspconfig.asm_lsp.setup({
                capabilities = capabilities
            })
            lspconfig.svls.setup({
                capabilities = capabilities,
                cmd = {"svls"},
                filetypes = {"verilog", "systemverilog"},
            })
            lspconfig.texlab.setup({
                capabilities = capabilities
            })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.lsp.set_log_level("debug")
        end,
    },
    {
        'davidhalter/jedi-vim',
        config = function()
        end,
    },
}
