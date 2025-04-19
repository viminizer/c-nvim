return{
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies={
		"nvim-treesitter/nvim-treesitter"
	},
	init=function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
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
						["<leader>j"] = {query="@parameter.inner", desc="Swap with next param"},
					},
					swap_previous = {
						["<leader>k"] = {query="@parameter.inner", desc="Swap with prev param"},
					},
				},
			}
		})
	end
}

