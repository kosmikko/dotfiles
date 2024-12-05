# Prerequisites: Install wezterm

# reload with exec zsh -il

# using https://wiki.zshell.dev/docs/getting_started/installation
source <(curl -sL init.zshell.dev); zzinit
# https://spaceship-prompt.sh/
source "/opt/homebrew/opt/spaceship/spaceship.zsh"

# https://github.com/trapd00r/LS_COLORS/blob/master/lscolors.sh
source ~/.zsh/ls_colors.sh
export TERM="xterm-256color" CLICOLOR=1

autoload -U select-word-style
select-word-style bash

# FNM