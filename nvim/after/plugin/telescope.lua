local builtin = require('telescope.builtin')

local function is_git_repo()
  vim.fn.system("git rev-parse --is-inside-work-tree");

  return vim.v.shell_error == 0;
end

local function get_git_root()
  local dot_git_path = vim.fn.finddir(".git", ".;");

  return vim.fn.fnamemodify(dot_git_path, ":h");
end

local function with_git_root_cwd(opts)
  if is_git_repo() then
    opts.cwd = get_git_root()
  end

  return opts
end

local get_path_and_tail = function(filename)
  local utils = require('telescope.utils')
  local bufname_tail = utils.path_tail(filename)
  local path_without_tail = require('plenary.strings').truncate(filename, #filename - #bufname_tail, '')
  local path_to_display = utils.transform_path({
    path_display = { 'truncate' },
  }, path_without_tail)

  return bufname_tail, path_to_display
end

local find_files = function(opts)
  local make_entry = require('telescope.make_entry')
  local strings = require('plenary.strings')
  local utils = require('telescope.utils')
  local entry_display = require('telescope.pickers.entry_display')
  local devicons = require('nvim-web-devicons')
  local def_icon = devicons.get_icon('fname', { default = true })
  local iconwidth = strings.strdisplaywidth(def_icon)

  opts = opts or {
    layout_strategy='horizontal',
    layout_config={
      width=0.95,
      prompt_position="top",
      preview_width=0.6
    },
    sorting_strategy="ascending"
  }

  with_git_root_cwd(opts)

  local entry_make = make_entry.gen_from_file(opts)
  opts.entry_maker = function(line)
    local entry = entry_make(line)
    local displayer = entry_display.create({
      separator = ' ',
      items = {
        { width = iconwidth },
        { width = nil },
        { remaining = true },
      },
    })
    entry.display = function(et)
      -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/make_entry.lua
      local tail_raw, path_to_display = get_path_and_tail(et.value)
      local tail = tail_raw .. ' '
      local icon, iconhl = utils.get_devicons(tail_raw)

      return displayer({
        { icon,            iconhl },
        tail,
        { path_to_display, 'TelescopeResultsComment' },
      })
    end
    return entry
  end

  return require('telescope.builtin').find_files(opts)
end

local git_files = function()
  local opts = with_git_root_cwd({
    layout_strategy='horizontal',
    layout_config={
      width=0.95,
      prompt_position="top",
      preview_width=0.6
    },
    sorting_strategy="ascending"
  });

  builtin.git_files(opts);
end

local function live_grep()
  local opts = with_git_root_cwd({});

  builtin.live_grep(opts);
end

local set_kymap = vim.keymap.set;

set_kymap('n', '<leader>ff', find_files, {})
set_kymap('n', '<leader>fg', live_grep, {})
set_kymap('n', '<leader>fb', builtin.buffers, {})
set_kymap('n', '<C-p>', git_files, {})


local status, telescope = pcall(require, "telescope")

if (not status) then
  print("Telescope is not installed")
  return
end

telescope.setup{
  defaults = {
    layout_config = {
      vertical = { width = 0.5 }
      -- other layout configuration here
    },
    wrap_results = true,
    path_display = {truncate = 3},
    dynamic_preview_title = true,

    color_devicons = true,
    mappings = {
      n = {
        ["j"] = false,
        ["k"] = "move_selection_next",
        ["l"] = "move_selection_previous",
        [";"] = false,
      }
    },
    -- other defaults configuration here
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim" -- add this value
    }
  },
  pickers = {
    find_files = {
     -- theme = "dropdown",
    }
  },
}

require("telescope").load_extension('harpoon')

