require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "typescript-language-server", "rust_analyzer", "lua_ls" }
vim.lsp.enable(servers)
