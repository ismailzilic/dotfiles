local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'", { desc = "Moves selected lines down in visual mode" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'", { desc = "Moves selected lines up in visual mode" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- Disable character yanking on deletion
vim.keymap.set("n", "x", '"_x', opts) -- Disable character yanking on single character deletion

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlight", silent = true })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- Open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- Close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") -- Go to next
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") -- Go to previous
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") -- Open current tab in a new tab

-- Split
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Makes split windows same size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Copy file path to clipboard
vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard:" .. filePath)
end, { desc = "Copied file path to clipboard" })
