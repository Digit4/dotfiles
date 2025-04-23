return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
  
    require("mini.ai").setup()
    require("mini.comment").setup()
    require("mini.move").setup()
    require("mini.pairs").setup()
    require("mini.splitjoin").setup()
    require("mini.surround").setup()
    require("mini.hipatterns").setup()
    require("mini.sessions").setup()
    require("mini.cursorword").setup()
    require("mini.map").setup()
    require("mini.indentscope").setup()
    require("mini.animate").setup({
      cursor = {
        enable = false,
      },
      scroll = {
        enable = true,
      },
      resize = {
        enable = false,
      },
      open = {
        enable = true,
      },
      close = {
        enable = true,
      },
    })
  end,
  lazy = false,
}
