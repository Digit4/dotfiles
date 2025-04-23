local plugins = {
  {
    "williamboman/mason.nvim",
    ensure_installed = {
      "lua-language-server",
      "typescript-language-server",
      "prettier",
    },
  }
}

return plugins
