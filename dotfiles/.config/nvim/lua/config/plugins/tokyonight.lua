return {
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "night",
        on_highlights = function(highlights, colors)
          highlights.LineNr = { fg = "#ffffff", bold = true }
          highlights.LineNrAbove = { fg = "#8e96f0" }
          highlights.LineNrBelow = { fg = "#8e96f0" }
        end
      })
      vim.cmd.colorscheme "tokyonight"
    end
  }
}
