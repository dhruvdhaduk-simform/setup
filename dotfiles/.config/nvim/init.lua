require("config.lazy")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.clipboard = "unnamedplus"

vim.opt.relativenumber = true
vim.opt.number = true

vim.filetype.add({
  extension = {
    h = "c",
    hpp = "cpp",
  },
})

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<space><space>y", "<cmd>%y<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>:nohlsearch<CR>")

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.css", "*.scss", "*.html" },

  callback = function()
    local marker_path = vim.fn.getcwd() .. "/" .. ".prettierrc"
    local has_marker = vim.fn.filereadable(marker_path) == 1
    if has_marker then
      vim.fn.system("npx prettier --write " .. vim.fn.fnamemodify(vim.fn.expand("%"), ":."))
      vim.cmd("edit")
    end
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
