local status, toggleterm = pcall(require, "toggleterm")
if not status then
  vim.notify("没有找到 toggleterm")
  return
end

toggleterm.setup{
    -- direction='tab',
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
