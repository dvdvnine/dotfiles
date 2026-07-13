-- NOTE: 'mise' is used as the tool provider instead of 'mason.nvim'.

Config.now_if_args(function()
  vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

  vim.lsp.enable({
    "lua_ls",
    "yamlls",
    "basedpyright",
  })
end)

Config.later(function()
  vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

  require("conform").setup({
    default_format_opts = {
      lsp_format = "fallback", -- allow formatting from LSP server if no formatter is available.
    },

    -- Make sure that necessary CLI tool is available.
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
    },
  })
end)
