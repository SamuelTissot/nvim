vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")

--- nice icons
local lspkind = require("lspkind")
lspkind.init({})

local cmp = require("cmp")

cmp.setup({
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]

			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]

			return vim_item
		end,
	},

	sorting = {
		priority_weight = 2,
		comparators = {
			-- Below is the default comparitor list and order for nvim-cmp
			cmp.config.compare.offset,
			-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,

			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},

	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "cmp-dbee" },
	},
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-y>"] = cmp.mapping(
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			{ "i", "c" }
		),
	},

	-- Enable luasnip to handle snippet expansion for nvim-cmp
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

local ls = require("luasnip")
ls.config.set_config({
	history = false,
	updateevents = "TextChanged,TextChangedI",
})

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/hels/core/snippets/*.lua", true)) do
	loadfile(ft_path)()
end

vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-h>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
