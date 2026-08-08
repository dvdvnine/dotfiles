vim.g.mapleader = " "

-- Enabled all filetype plugins and syntax (if not enabled):
vim.cmd("filetype plugin indent on")

if vim.fn.exists("syntax_on") ~= 1 then
  vim.cmd("syntax enable")
end

vim.o.backup = false -- no permanent backup while writing
vim.o.writebackup = true -- temp backup while writing
vim.o.swapfile = false -- no file for crash recovery
vim.o.undofile = true -- enable persistent undo
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- limit ShaDa file

vim.o.mouse = "a" -- enable mouse
vim.o.mousescroll = "ver:25,hor:6" -- set mouse scroll speed
vim.o.switchbuf = "usetab" -- use already opened buffers when switching

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes" -- always show left sign column for breakpoints, etc (less flicker)

vim.o.cursorline = true
vim.o.cursorlineopt = "screenline,number"

vim.o.colorcolumn = "+1" -- highlight one column after text width (if 'textwidth')

vim.o.showmode = false -- don't show mode
vim.o.ruler = false -- don't show cursor coordinates
vim.o.shortmess = "CFOSWaco" -- disable some built-in completion messages

vim.o.winborder = "single" -- use border in floating windows
vim.o.pumheight = 10 -- limit popup menu height
vim.o.pummaxwidth = 100 -- limit popup menu width
vim.o.pumborder = "single" -- use border in popup menu

-- TODO: конфликтует с плагином прокрутки создавая артефакты и рывки.
-- vim.o.scrolloff = 8 -- vertical cursor padding
-- vim.o.sidescrolloff = 8 -- horizontal cursor padding

vim.o.splitkeep = "screen" -- keep same screen position when splitting windows
vim.o.splitbelow = true -- horizontal splits will be below
vim.o.splitright = true -- vertical splits will be to right

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.autoindent = true
vim.o.smartindent = true

vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
vim.o.formatoptions = "rqnl1j" -- improve comment editing

vim.o.wrap = false -- toggle with `\w`
vim.o.linebreak = true -- don't split words
vim.o.breakindent = true -- indent wrapped lines to match line start
vim.o.breakindentopt = "list:-1" -- add padding for lists

-- More is set via `mini.basics` later:
vim.o.list = true -- show invisible chars
vim.o.listchars = "extends:…,nbsp:␣,precedes:…,tab:> "
vim.o.fillchars = "eob: ,fold:╌"

vim.o.foldlevel = 10 -- fold nothing by default
vim.o.foldmethod = "indent"
vim.o.foldnestmax = 10
vim.o.foldtext = ""

vim.o.virtualedit = "block" -- allow going past end of line in blockwise mode
vim.o.iskeyword = "@,48-57,_,192-255,-" -- treat dash as `word` textobject part

vim.o.incsearch = true -- live search matches
vim.o.ignorecase = true
vim.o.smartcase = true

-- Default dir path `~/.local/share/nvim/site/spell/`.
vim.o.spell = false
vim.o.spelllang = "en_us,ru"
vim.o.spelloptions = "camel" -- handle 'camelCase'

vim.o.infercase = true -- infer case in built-in completion
vim.o.complete = ".,w,b" -- use less source
vim.o.completeopt = "menuone,noselect,fuzzy,nosort" -- use custom behavior
vim.o.completetimeout = 100

Config.later(function()
  vim.diagnostic.config({
    signs = {
      priority = 9999,
      severity = { min = vim.diagnostic.severity.WARN },
    },

    -- Show all diagnostics as underline (for their messages type `<leader>ld`).
    underline = {
      severity = { min = vim.diagnostic.severity.HINT },
    },

    -- Show more details immediately for errors on the current line.
    virtual_lines = false,
    virtual_text = {
      current_line = true,
      severity = vim.diagnostic.severity.ERROR,
    },

    update_in_insert = false, -- don't update diagnostics when typing
  })
end)
