-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move with custor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search with cursor in the middle of the screen
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Sed current word
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Doesn't lose current past on highlight
vim.keymap.set("v", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>yf", function()
  vim.fn.setreg("+", vim.fn.expand("%:t"))
end, { desc = "Copy file name" })

vim.keymap.set("n", "<leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p:."))
end, { desc = "Copy file path" })
