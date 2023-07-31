local lsp_zero_config = function ()
  local lsp_zero = require("lsp-zero")

  lsp_zero.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
    sign_icons = {
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = ''
    }
  })

  -- vim.diagnostic.disable();

  lsp_zero.ensure_installed({
    "tsserver",
    "eslint",
    "lua_ls",
    "rust_analyzer"
  })

  lsp_zero.skip_server_setup({"tsserver", "eslint"})

  -- lsp_zero.setup()
end

return {
  "VonHeikemen/lsp-zero.nvim",

  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  },

  config = lsp_zero_config,
}
