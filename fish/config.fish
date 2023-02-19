#!/usr/bin/fish

# Kanagawa Fish shell theme
# A template was taken and modified from Tokyonight:
# https://github.com/folke/tokyonight.nvim/blob/main/extras/fish_tokyonight_night.fish
set -l fujiWhite DCD7BA
set -l waveBlue2 2D4F67
set -l fujiGray 727169
set -l autumnRed C34043
set -l orange FF9E64
set -l boatYellow2 C0A36E
set -l autumnGreen 76946A
set -l waveAqua2 7AA89F
set -l sakuraPink D27E99
set -l crystalBlue 7E9CD8
set -l winterRed 43242B
set -l oldWhite C8C093
set -l autumnYellow DCA561
set -l dragonBlue 658594
set -l oniViolet 957FB8


# Syntax Highlighting Colors
set -g fish_color_normal $fujiWhite
set -g fish_color_command $waveAqua2
set -g fish_color_keyword $sakuraPink
set -g fish_color_quote $boatYellow2
set -g fish_color_redirection $fujiWhite
set -g fish_color_end $orange
set -g fish_color_error $autumnRed
set -g fish_color_param $oniViolet
set -g fish_color_comment $fujiGray
set -g fish_color_selection --background=$waveBlue2
set -g fish_color_search_match --background=$waveBlue2
set -g fish_color_operator $autumnGreen
set -g fish_color_escape $sakuraPink
set -g fish_color_autosuggestion $fujiGray
set -g fish_color_user $autumnYellow
set -g fish_color_cwd $oniViolet

# Completion Pager Colors
set -g fish_pager_color_progress $fujiGray
set -g fish_pager_color_prefix $waveAqua2
set -g fish_pager_color_completion $fujiWhite
set -g fish_pager_color_description $fujiGray

if status is-interactive
    # Commands to run in interactive sessions can go here
end

