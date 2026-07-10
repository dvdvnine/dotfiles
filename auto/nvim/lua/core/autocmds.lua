-- Don't auto-wrap comments and don't insert comment leader after hitting `o`.
local f = function()
  vim.cmd("setlocal formatoptions-=c formatoptions-=o")
end

-- Do on 'FileType' to always override these changes from filetype plugins.
Config.new_autocmd("FileType", nil, f, "Set proper 'formatoptions'")

-- NOTE: there are other autocmds created by 'mini.basics'.
