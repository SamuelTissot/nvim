return {
	-- add any tools you want to have installed below
	{
		"williamboman/mason.nvim",
		opts = function()
			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
				"jq",
				"prettier",
				"djlint",
				"golines",
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		end,
	},
}
