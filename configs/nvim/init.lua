-- Influenced by:
-- https://github.com/LunarVim/Neovim-from-scratch


if vim.g.vscode then
  -- Visual Studio Code with Neovim extension
  local option = vim.opt
  local keymap = vim.keymap.set
  local command = vim.cmd

  local params = { noremap = true, silent = true }


  -- sync with system clipboard
  option.clipboard = "unnamedplus"

  -- case-insensitive search
  option.ignorecase = true

  -- disable "ignorecase" option if the search pattern contains upper case characters
  option.smartcase = true

  -- text deleted after pasting goes into a "black hole"
  keymap("v", "p", '"_dP', params)

  -- skip folds
  command("nmap j gj")
  command("nmap k gk")
else
  -- ordinary Neovim
  require "options"
  require "keybindings"
end
