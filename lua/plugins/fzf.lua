return{
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  opts = {},
  keys={
    {
      "<leader>ff", 
      function() require('fzf-lua').files() end,
      desc="Find Files in CWD"
    },
    {
      "<leader>fg", 
      function() require('fzf-lua').live_grep_native() end,
      desc="Find Files in Project Directory"
    },
    {
      "<leader>fc", 
      function() require('fzf-lua').files({cwd=vim.fn.stdpath("config")}) end,
      desc="Find in Neovim Configuration"
    },
  }
}
