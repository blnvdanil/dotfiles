return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,

  config = function ()
    local config = {
      theme = "lotus",
      transparent = true,
      background = {
        dark = "wave",
        light = "lotus",
      },
      overrides = function(colors)
        local theme = colors.theme

        return {
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
        }
      end,
    }


    if config.transparent then
      config.colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      }
    end

    require("kanagawa").setup(config)
  end
}
