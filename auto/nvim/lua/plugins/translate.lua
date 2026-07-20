Config.later(function()
  vim.pack.add({ "https://github.com/uga-rosa/translate.nvim" })

  require("translate").setup({
    default = {
      command = "google",
      parse_after = "head,window",
    },

    preset = {
      parse_after = {
        window = {
          width = 0.6,
        },
      },
    },
  })
end)
