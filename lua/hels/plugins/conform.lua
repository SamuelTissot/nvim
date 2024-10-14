return {
	"stevearc/conform.nvim",
	-- lazy = false,
	opts = function()
		require("conform").setup({
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_fallback = true,
				timeout_ms = 500,
			},
			formatters = {
				golines = {
					args = "--max-len=80",
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt", "goimports", "golines" },
				-- Use a sub-list to run only the first available formatter
				javascript = { "prettier" },
				gotmpl = { "djlint" },
			},
		})
	end,
	keys = require("hels.core.keymaps").conformKeys(),
}
-- vim: ts=2 sts=2 sw=2 et
