return {
  on_attach = function(client, buf_id)
    -- Reduce very long list of triggers for better 'mini.completion' experience.
    client.server_capabilities.completionProvider.triggerCharacters = { ".", ":", "#", "(" }
  end,

  -- 'LuaLS' structure of these settings comes from 'LuaLS', not Neovim.
  settings = {
    Lua = {
      -- Use 'LuaJIT', as it built into Neovim.
      runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
      workspace = {
        ignoreSubmodules = true,
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
}
