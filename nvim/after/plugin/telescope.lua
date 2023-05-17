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

local find_files = function()
  local opts = with_git_root_cwd({
    layout_strategy='horizontal',
    layout_config={
      width=0.95,
      prompt_position="top",
      preview_width=0.6
    },
    sorting_strategy="ascending"
  });

  builtin.find_files(opts)
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

vim.keymap.set('n', '<leader>ff', find_files, {})
vim.keymap.set('n', '<leader>fg', live_grep, {})
vim.keymap.set('n', '<C-p>', git_files, {})


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
    mappings = {
      n = {
        ["j"] = false,
        ["k"] = "move_selection_next",
        ["l"] = "move_selection_previous",
        [";"] = false,
      }
    }
    -- other defaults configuration here
  },
  pickers = {
    find_files = {
     -- theme = "dropdown",
    }
  },
}

require("telescope").load_extension('harpoon')

