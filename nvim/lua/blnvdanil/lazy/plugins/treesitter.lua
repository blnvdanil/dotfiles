return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",

      "comment",
      "javascript",
      "typescript",
      "html",
      "tsx",
      "scss",
      "css",

      "markdown",
      "markdown_inline",

      "gitignore",
      "git_rebase",
      "gitcommit",
      "diff",

      "fish",
      "bash",
      "rust",
    },

    sync_install = false,

    auto_install = true,

    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

        if ok and stats and stats.size > max_filesize then
          return true
        end

        return false
      end,
      additional_vim_regex_highlighting = false,
    },
  }
}