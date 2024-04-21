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
  -- TODO: try vimscript plugins, but then I suspect I have to configure them
  -- here as well instead of in .vimrc?
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  }
})

local on_attach = function(_, _)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover)
end

require("lspconfig").tsserver.setup({
  on_attach = on_attach,
  -- capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})
