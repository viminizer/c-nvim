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
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["ac"] = "@class.outer",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ic"] = "@class.inner",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>j"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>k"] = "@parameter.inner",
            },
          },
        }
      })
      end
    },
  }
