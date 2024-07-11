if not vim.g.vscode then
  require("keymap")
  require("option")
  require("plugin")
else
  require("code")
end
