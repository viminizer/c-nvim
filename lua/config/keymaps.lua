vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "-", "<cmd>Oil --float <CR>", { desc = "Open parent dir in Oil" })
vim.keymap.set("i", "kk", "<Esc>", { desc = "Double k to Esc" })

vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ lsp_format = "fallback" })
end, { desc = "Format current file" })
-- Map keys to create new lines above or below the cursor
vim.keymap.set("n", "]<Space>", "m`o<Esc>``", { desc = "Add line below", silent = true })
vim.keymap.set("n", "[<Space>", "m`O<Esc>``", { desc = "Add line above", silent = true })

-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>qr", "q", { desc = "Record Macro" })
-- windows
vim.keymap.set("n", "<leader>wh", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>bd", function()
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
	if #buffers > 1 then
		-- Pick the previous or next buffer smartly
		local current = vim.fn.bufnr()
		vim.cmd("bprevious")
		if vim.fn.bufnr() == current then
			vim.cmd("bnext")
		end
		vim.cmd("bdelete " .. current)
	else
		vim.cmd("bdelete")
	end
end, { desc = "Delete current buffer nicely", silent = true })
vim.keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Delete other buffers", silent = true })
vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })
