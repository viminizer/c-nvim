vim.opt.winbar = "%=%m %f"
vim.opt.autowriteall = true -- Enable auto write
vim.opt.textwidth = 85
vim.opt.wrap = true
vim.opt.autoread = true -- Automatically read files when changed externally
vim.opt.autoindent = true   -- Enable autoindent
vim.opt.smartindent = true
vim.opt.tabstop = 4 -- Number of visual spaces per TAB
vim.opt.shiftwidth = 4 -- Indentation amount for autoindents
vim.opt.softtabstop=4
vim.opt.expandtab = true -- Use tabs instead of spaces
vim.opt.smarttab = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.signcolumn = "yes"
vim.opt.inccommand = "split"
vim.opt.scrolloff = 7
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.updatetime=250
vim.opt.splitright=true
vim.opt.splitbelow=true 
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.confirm=true
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.g.markdown_recommended_style = 0



-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.scss", "*.html", "*.md" }, -- Add your file types
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Configure diagnostics to use floating windows
vim.diagnostic.config({
  update_in_insert = true, -- Update diagnostics while typing
  underline = true,
  virtual_text = { spacing = 4, prefix = "●" },
  signs = true,
  severity_sort = true,
  float = {
    border = "rounded", -- Rounded corners for a clean look
    severity_sort = true, -- Sort the errors by severity (highest to lowest)
    max_width = 80, -- Set a maximum width for the floating window to avoid overflow
    max_height = 20, -- Set a maximum height to avoid the window becoming too large
  },
})

-- Automatically open floating diagnostics on cursor hold
vim.cmd("autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })")

-- Keybinding to manually open diagnostics in a floating window
vim.keymap.set("n", "<leader>ud", vim.diagnostic.open_float, { desc = "Show diagnostics" })
