return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        sync_install=false,
        highlight = { enable = true },
        indent = { enable = true }, 
        ensure_installed = {
          "bash", 
          "c",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "lua",
          "luadoc",
          "luap", "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
          "go",
          "gomod",
          "gowork",
          "gosum",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            node_incremental = "<Enter>",
            scope_incremental = false,
            init_selection = "<Enter>",
            node_decremental = "<Backspace>",
          },
        }
      })
    end
  },
}
