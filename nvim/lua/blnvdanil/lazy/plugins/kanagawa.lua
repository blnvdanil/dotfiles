return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    vim.cmd("colorscheme kanagawa-wave")
    -- vim.cmd("colorscheme kanagawa-lotus") -- light
    -- vim.cmd("colorscheme kanagawa-dragon") -- dark
  end
}
