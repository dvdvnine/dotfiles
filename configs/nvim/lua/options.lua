local options = {
  -- creates a backup file
  backup = false,

  -- creates a swapfile
  swapfile = false,

  -- enable persistent undo
  undofile = true,

  -- sync with the system clipboard
  clipboard = "unnamedplus",

  -- allow the mouse
  mouse = "a",

  -- display lines as one long line
  wrap = true,

  -- companion to wrap, don't split words
  linebreak = true,

  -- minimal number of screen lines to keep above and below the cursor
  scrolloff = 8,

  -- minimal number of screen columns either side of cursor if wrap is `false`
  sidescrolloff = 8,

  -- make indenting smarter again
  smartindent = true,

  -- convert tabs to spaces
  expandtab = true,

  -- the number of spaces inserted for each indentation
  shiftwidth = 2,

  -- insert n spaces for a tab
  tabstop = 2,

  -- the encoding written to a file
  fileencoding = "utf-8",

  -- highlight all matches on previous search pattern
  hlsearch = true,

  -- ignore case in search patterns
  ignorecase = true,

  -- disable "ignorecase" option if the search pattern contains upper case characters
  smartcase = true,

  -- more space in the neovim command line for displaying messages
  cmdheight = 2,

  -- always show the sign column, otherwise it would shift the text each time
  signcolumn = "yes",

  -- set numbered lines
  number = true,

  -- set relative numbered lines
  relativenumber = true,

  -- set number column width to n (default 4)
  numberwidth = 4,

  -- so that `` is visible in markdown files
  conceallevel = 0,
}

for key, value in pairs(options) do
  vim.opt[key] = value

end


-- hyphenated words recognized by searches
vim.opt.iskeyword:append "-"

-- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode
vim.opt.formatoptions:remove({ "c", "r", "o" })
