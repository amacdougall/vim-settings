-- init lazy.nvim package manager
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable", -- latest stable release
	lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {},
  }
})

require("typescript-tools").setup({
	on_attach = function(_, bufnr)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		-- K to hover
		buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
		-- reformat on save
		buf_set_keymap("n", "<Leader>fs", "<cmd>lua vim.lsp.buf.format()<CR><cmd>:w<CR>", { noremap = true, silent = true })
		-- references to current symbol
		buf_set_keymap("n", "<Leader>tr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
		-- implementations of current symbol; what you know about that?
		buf_set_keymap("n", "<Leader>ti", "<cmd>lua vim.lsp.buf.implementations()<CR>", { noremap = true, silent = true })
	end,
})
