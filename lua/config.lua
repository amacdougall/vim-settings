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
  -- core
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- requires the tree-sitter CLI (brew install tree-sitter-cli)
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local langs = {
        "markdown", "markdown_inline", "ruby", "javascript", "typescript",
        "tsx", "python", "bash", "json", "sql", "go", "clojure",
        "lua", "vim", "vimdoc",
      }
      require("nvim-treesitter").install(langs)
      -- main branch no longer auto-enables highlighting
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          -- huge files (e.g. 40k-line scratch.rb): async parsing leaves the far
          -- end unhighlighted after a jump, so use regular syntax instead
          if vim.api.nvim_buf_line_count(args.buf) > 20000 then
            return
          end
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },

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
  { "wincent/ferret" },

  -- editing
  { "tpope/vim-surround" },
  { "michaeljsmith/vim-indent-object" },
  { "tpope/vim-repeat" },
  { "vim-scripts/YankRing.vim" },
  { "sevenc-nanashi/neov-ime.nvim" },

  -- navigation within buffer
  { "Lokaltog/vim-easymotion" },
  { "vim-scripts/wokmarks.vim" },
  { "vim-scripts/matchit.zip" },
  { "vim-scripts/ruby-matchit" },

  -- color support
  { "tjdevries/colorbuddy.nvim" },
  -- colors
  
  { "phha/zenburn.nvim" },
  { "NLKNguyen/papercolor-theme" },
  { "amacdougall/Birds-of-Paradise-VIM-Theme" },
  { "amacdougall/badwolf" },
  { "amacdougall/inkpot" },
  { "amacdougall/jellybeans.vim" },
  { "amacdougall/vim-javascript" },
  { "amacdougall/vim-pyte" },
  {
    "svrana/neosolarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("neosolarized").setup({
        comment_italics = true,
        background_set = true,
      })
      vim.cmd.colorscheme("neosolarized")
    end,
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
  },

  -- completion
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
    -- show floating diagnostic
    buf_set_keymap("n", "<Leader>ee", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
    -- show diagnostics in quickfix list 
    buf_set_keymap("n", "<Leader>el", "<cmd>lua vim.diagnostic.setqflist()<CR>", { noremap = true, silent = true })
	end,
})

-- markdown highlight overrides, reapplied for whichever colorscheme is active
local function markdown_overrides()
  local set = vim.api.nvim_set_hl

  set(0, "@markup.heading.1.markdown", { link = "Statement" })
  set(0, "@markup.heading.2.markdown", { link = "Function" })
  set(0, "@markup.heading.3.markdown", { link = "Type" })
  set(0, "@markup.raw.markdown_inline", { link = "String" })
  set(0, "@markup.quote.markdown", { link = "String" })
  -- fenced code with no language tag: body text color; tagged fences get
  -- their language's own highlighting via injection
  set(0, "@markup.raw.block.markdown", { link = "Normal" })
  set(0, "@markup.raw.delimiter.markdown", { link = "Comment" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = markdown_overrides,
})

vim.cmd.colorscheme("neosolarized")
