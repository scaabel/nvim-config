require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>fm", function()
require("conform").format({ async = true, lsp_fallback = true })
  map("n", "<leader>dr", vim.diagnostic.open_float)
end, { desc = "custom format files" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
