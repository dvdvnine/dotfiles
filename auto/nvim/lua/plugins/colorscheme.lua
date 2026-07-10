Config.now(function()
  vim.pack.add({
    -- 'https://github.com/sainnhe/everforest',
    -- 'https://github.com/Shatur/neovim-ayu',
    -- 'https://github.com/ellisonleao/gruvbox.nvim',
    "https://github.com/rose-pine/neovim",
  })

  require("rose-pine").setup({
    variant = "auto", -- auto | main | moon | dawn.
    dark_variant = "main",

    styles = {
      bold = true,
      italic = false,
      transparency = false,
    },
  })

  vim.cmd("color rose-pine")
end)
