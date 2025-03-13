return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    config = function()
      require("codesnap").setup({
        save_path = "~/Pictures/CodeSnap",
        has_breadcrumbs = true,
        show_workspace = true,
        bg_x_padding = 25,
        bg_y_padding = 25,
        bg_padding = nil,
        has_line_number = true,
        bg_theme = "grape",
        watermark = "",
      })

      vim.keymap.set("v", "<space>ss", ":CodeSnapSave<CR>")
    end
  },
}
