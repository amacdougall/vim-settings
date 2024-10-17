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
  -- typescript
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  -- files and finders
  { "junegunn/fzf" },
  {
    "junegunn/fzf.vim",
    keys = {
      {
		  "<Leader>ff",
		  "<cmd>:call fzf#run({'source': 'ag --hidden -p ~/.ignore -l -g \"\"', 'sink': 'e'})<CR>",
		  desc = "fzf find files",
	  },
    }
  },
  { "jeetsukumaran/vim-buffergator" },
  { "vim-scripts/The-NERD-tree" },
  { "mileszs/ack.vim" },

  -- editing
  { "tpope/vim-surround" },
  { "michaeljsmith/vim-indent-object" },
  { "tpope/vim-repeat" },
  { "vim-scripts/YankRing.vim" },

  -- navigation within buffer
  { "Lokaltog/vim-easymotion" },
  { "vim-scripts/wokmarks.vim" },
  { "vim-scripts/matchit.zip" },
  { "vim-scripts/ruby-matchit" },

  -- colors
  { "NLKNguyen/papercolor-theme" },
  { "amacdougall/Birds-of-Paradise-VIM-Theme" },
  { "amacdougall/Zenburn" },
  { "amacdougall/badwolf" },
  { "amacdougall/inkpot" },
  { "amacdougall/jellybeans.vim" },
  { "amacdougall/vim-javascript" },
  { "amacdougall/vim-pyte" },
  { "icymind/NeoSolarized" },

  -- completion
  { "ervandew/supertab" },
  { "github/copilot.vim" },

  -- external
  { "jpalardy/vim-slime" },
  { "kovisoft/slimv" },

  -- language-specific
  { "exu/pgsql.vim" },
  { "fatih/vim-go" },
  { "guns/vim-clojure-static" },
  { "guns/vim-sexp" },
  { "maxmellon/vim-jsx-pretty" },
  { "peitalin/vim-jsx-typescript" },
  { "tpope/vim-haml" },
  { "tpope/vim-sexp-mappings-for-regular-people" },
  { "vim-ruby/vim-ruby" },

  -- syntax checking
  { "scrooloose/syntastic" },

  -- misc
  { "junegunn/goyo.vim" },
  { "tpope/vim-fugitive" },
  { "mbbill/undotree" },
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
