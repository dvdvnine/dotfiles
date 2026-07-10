-- NOTE: do not change on_attach; it will break commands like `:LspPyright...`.

return {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "basic",
        diagnosticMode = "openFilesOnly", -- check open files, not the whole project.

        disableOrganizeImports = true,
        useLibraryCodeForTypes = true,
        autoImportCompletions = false, -- Use `:LspPyrightOrganizeImports` to run manually.
      },
    },
  },
}
