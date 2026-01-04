return {
    -- {
    --     "williamboman/mason.nvim",
    --     lazy = false,
    --     config = function()
    --         require("mason").setup()
    --     end,
    -- },
    -- {
    --     "mason-org/mason-lspconfig.nvim",
    --     opts = {
    --         ensure_installed = {
    --             "lua_ls",
    --             "pylsp",
    --             "jdtls",
    --             "jsonls",
    --         },
    --     },
    --     dependencies = {
    --         { "mason-org/mason.nvim", opts = {} },
    --         "neovim/nvim-lspconfig",
    --     },
    -- },
    -- {
    --     "williamboman/mason-lspconfig.nvim",
    --     lazy = false,
    --     config = function()
    --         require("mason-lspconfig").setup({
    --             ensure_installed = {
    --                 "lua_ls",
    --                 "pylsp",
    --                 "jdtls",
    --                 "jsonls",
    --             },
    --         })
    --     end,
    -- },
    --  require("mason-tool-installer").setup({
    --
    --      -- a list of all tools you want to ensure are installed upon start
    --      ensure_installed = {
    --          -- you can pin a tool to a particular version
    --          { "java-debug-adapter" },
    --
    --          -- you can turn off/on auto_update per tool
    --          { "java-test" },
    --          { "prettier" },
    --          { "isort" },
    --          { "flake8" },
    --          { "jq" },
    --          { "stylua" },
    --      },
    -- }),
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   config = function()
    --     require("lsp_signature").setup({})
    --   end,
    -- },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim",    opts = {} },
            { "williamboman/mason-lspconfig.nvim", opts = {} },
            { "WhoIsSethDaniel/mason-tool-installer.nvim" },
            { "hrsh7th/cmp-nvim-lsp" },
        },
        lazy = false,
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pylsp",
                    "jdtls",
                    "jsonls",
                },
            })

            require("mason-tool-installer").setup({
                -- a list of all tools you want to ensure are installed upon start
                ensure_installed = {
                    -- you can pin a tool to a particular version
                    { "java-debug-adapter" },
                    -- you can turn off/on auto_update per tool
                    { "java-test" },
                    { "prettier" },
                    { "isort" },
                    { "flake8" },
                    { "jq" },
                    { "stylua" },
                },
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            vim.lsp.config('*', {
                capabilities = capabilities,
            })


            local mason_lspconfig = require("mason-lspconfig")
            local installed_servers = mason_lspconfig.get_installed_servers()

            for _, server in ipairs(installed_servers) do
                if server ~= "jdtls" then
                    local server_opts = { capabilities = capabilities }
                    if server == "pylsp" then
                        server_opts.settings = {
                            pylsp = {
                                plugins = {
                                    pycodestyle = {
                                        maxLineLength = 120,
                                    },
                                    pyflakes = { enabled = false },
                                    flake8 = {
                                        enabled = true,
                                        maxLineLength = 120,
                                    },
                                },
                            },
                        }
                    end
                    vim.lsp.config(server, server_opts)
                    vim.lsp.enable(server)
                end
            end

            -- -- local lspconfig = require("lspconfig")
            -- local lsp_attach = function(client, bufnr)
            --     -- Create your keybindings here...
            -- end
            --
            -- -- Call setup on each LSP server
            -- require("mason-lspconfig").setup_handlers({
            --     function(server_name)
            --         -- Don't call setup for JDTLS Java LSP because it will be setup from a separate config
            --         if server_name ~= "jdtls" then
            --             lspconfig[server_name].setup({
            --                 on_attach = lsp_attach,
            --                 capabilities = capabilities,
            --             })
            --         end
            --     end,
            -- })
            -- lspconfig.lua_ls.setup({
            --     capabilities = capabilities,
            -- })
            -- lspconfig.jdtls.setup({
            -- 	capabilities = capabilities,
            -- })
            -- lspconfig.pylsp.setup({
            --     capabilities = capabilities,
            --     settings = {
            --         pylsp = {
            --             configurationSources = { "flake8" },
            --             plugins = {
            --                 autopep8 = {
            --                     enabled = false,
            --                 },
            --                 black = {
            --                     enabled = false,
            --                 },
            --                 flake8 = {
            --                     enabled = true,
            --                     -- exclude = { "tests/" },
            --                 },
            --                 isort = {
            --                     enabled = true,
            --                 },
            --                 pylint = {
            --                     enabled = false,
            --                 },
            --             },
            --         },
            --     },
            -- })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client.supports_method("textDocument/codeAction") then
                        -- Create a keymap for vim.lsp.buf.code_action()
                        vim.keymap.set("n", "gra", vim.lsp.buf.code_action, {})
                    end
                    if client.supports_method("textDocument/references") then
                        -- Create a keymap for vim.lsp.buf.references()
                        vim.keymap.set("n", "grr", vim.lsp.buf.references, {})
                    end
                    if client.supports_method("textDocument/rename") then
                        -- Create a keymap for vim.lsp.buf.rename()
                        vim.keymap.set("n", "grn", vim.lsp.buf.rename, {})
                    end
                    -- if client.supports_method("textDocument/formatting") then
                        -- set up a vim motion for <Space> + c + f to automatically format our code based on which langauge server is active
                        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
                    -- end
                    if client.supports_method("textDocument/rangeFormatting") then
                        vim.keymap.set("v", "<leader>cf", function()
                            vim.lsp.buf.format({
                                range = {
                                    ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
                                    ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
                                },
                            })
                        end, { desc = "Format selected text" })
                    end
                    if client.supports_method("textDocument/implementation") then
                        -- Create a keymap for vim.lsp.buf.implementation
                        vim.keymap.set("n", "gri", vim.lsp.buf.implementation, {})
                    end
                    if client.supports_method("textDocument/completion") then
                        -- vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
                        vim.lsp.completion.enable()
                    end
                end,
            })

            -- vim.diagnostic.config({
            --     signs = true,
            --     virtual_lines = true,
            -- })
        end,
    },
}
