return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,

  config = function ()
    require("kanagawa").setup {
      theme = "lotus",
      background = {
        dark = "wave",
        light = "lotus",
      },
    }

    vim.cmd("colorscheme kanagawa");
  end
}
