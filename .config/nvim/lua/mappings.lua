require "nvchad.mappings"
local snipe = require "snipe"
local harpoon = require "harpoon"
-- local blink = require "blink"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "<A-CR>", "<End><CR>", { desc = "C-CR moves the cursor to new line" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)
vim.keymap.set("n", "<C-o>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>1", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end)

harpoon:extend {
  UI_CREATE = function(cx)
    vim.keymap.set("n", "<C-v>", function()
      harpoon.ui:select_menu_item { vsplit = true }
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-x>", function()
      harpoon.ui:select_menu_item { split = true }
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-t>", function()
      harpoon.ui:select_menu_item { tabedit = true }
    end, { buffer = cx.bufnr })
  end,
}

local harpoon_extensions = require "harpoon.extensions"
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

-- Snipe mappings

map("n", "<leader><leader>", function()
  snipe.open_buffer_menu()
end, { desc = "Open Snipe buffer menu" })

-- blink opts
-- blink.select_next
