Config.later(function()
  vim.pack.add({ "https://github.com/pk-hash/smart-im.nvim" })

  require("smart-im").setup({
    default_im = "us",
  })
end)
