return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },

  config = function ()
    local nvim_lsp = require 'lspconfig'

    require("typescript-tools").setup {
      on_attach = function (client, bufnr)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition,  {buffer = bufnr})
      end,
      settings = {
        -- spawn additional tsserver instance to calculate diagnostics on it
        separate_diagnostic_server = true,
        -- "change"|"insert_leave" determine when the client asks the server about diagnostic
        publish_diagnostic_on = "insert_leave",
        -- array of strings("fix_all"|"add_missing_imports"|"remove_unused")
        -- specify commands exposed as code_actions
        expose_as_code_action = {},
        -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
        -- not exists then standard path resolution strategy is applied
        tsserver_path = nil,
        -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
        -- (see 💅 `styled-components` support section)
        tsserver_plugins = {  "@monodon/typescript-nx-imports-plugin" },
        -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
        -- memory limit in megabytes or "auto"(basically no limit)
        tsserver_max_memory = "auto",
        -- described below
        tsserver_format_options = {},
        tsserver_file_preferences = {},
      },
      root_dir = nvim_lsp.util.root_pattern ".git",
    }
  end
}
