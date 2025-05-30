vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.env" },
	callback = function()
		vim.b.autoformat = false
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "dotenv" },
	callback = function()
		vim.b.autoformat = false
	end,
})

vim.api.nvim_create_autocmd("colorscheme", {
	pattern = "*",
	callback = function()
		vim.cmd([[
      highlight minifilesnormal guibg=none ctermbg=none
      highlight minifilesborder guifg=#ffa500 guibg=none
      highlight minifilestitle guifg=#ffa500 guibg=none
      highlight minifilestitlefocused guifg=#ffa500 guibg=none
      highlight minitablinecurrent guifg=#ffa500 guibg=none
      highlight minitablinemodifiedcurrent guibg=none guifg=red
      highlight minitablinefill guibg=none
      highlight noicecmdlinepopup guibg=none ctermbg=none
      highlight noicecmdlinepopupborder guifg=#ffa500 guibg=none
      highlight normal guibg=none ctermbg=none guifg=#ffa500
      highlight linenr guibg=none ctermbg=none
      highlight cursorlinenr guibg=none ctermbg=none
      highlight signcolumn guibg=none ctermbg=none
      highlight foldcolumn guibg=none ctermbg=none
      highlight normalfloat guibg=none ctermbg=none
      highlight floatborder guibg=none ctermbg=none guifg=#ffa500
      highlight floattitle guibg=none ctermbg=none guifg=#ffa500
      highlight visual guibg=#3b4252 guifg=#ffa500
      ]])
	end,
})

-- format on save
vim.api.nvim_create_autocmd("bufwritepre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
local function augroup(name)
	return vim.api.nvim_create_augroup("viminizer_" .. name, { clear = true })
end

-- check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "focusgained", "termclose", "termleave" }, {
	group = augroup("checktime"),
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- highlight on yank
vim.api.nvim_create_autocmd("textyankpost", {
	group = augroup("highlight_yank"),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "vimresized" }, {
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("bufreadpost", {
	group = augroup("last_loc"),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("filetype", {
	group = augroup("close_with_q"),
	pattern = {
		"plenarytestpopup",
		"checkhealth",
		"dbout",
		"gitsigns-blame",
		"grug-far",
		"help",
		"lspinfo",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "quit buffer",
			})
		end)
	end,
})

-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("filetype", {
	group = augroup("man_unlisted"),
	pattern = { "man" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
	end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("filetype", {
	group = augroup("wrap_spell"),
	pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- fix conceallevel for json files
vim.api.nvim_create_autocmd({ "filetype" }, {
	group = augroup("json_conceal"),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

-- auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "bufwritepre" }, {
	group = augroup("auto_create_dir"),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})
