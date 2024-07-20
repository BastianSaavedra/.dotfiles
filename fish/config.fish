if status is-interactive
    # Commands to run in interactive sessions can go here
    alias sscrot="scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png"
    set -gx PATH /usr/local/bin $PATH
    # python alias
    alias pyvenv="python3 -m venv"
    alias pyvenvcloud="python3 -m virtualenv --always-copy venv"
    alias activate="source venv/bin/activate.fish"
    alias pyright="cp ~/pCloudDrive/Workspace/Utilities/Python/pyrightconfig.json ."

    alias mongodbstart="sudo systemctl start mongodb.service"
    alias mongodbstop="sudo systemctl stop mongodb.service"

    alias postgrestart="sudo systemctl start postgresql.service"
    alias postgrestop="sudo systemctl stop postgresql.service"

    # git token alias
    alias token="cat ~/pCloudDrive/Workspace/Utilities/Tokens/git_token.txt | xclip -selection clipboard"

    # edit alias
    alias eqtile="nvim ~/.dotfiles/qtile/"
    alias envim="nvim ~/.dotfiles/nvim/"
    alias ealacritty="nvim ~/.dotfiles/alacritty/"
    alias erofi="nvim ~/.dotfiles/rofi/"
    alias efish="nvim ~/.dotfiles/fish/"
    alias eomf="nvim ~/.dotfiles/omf/"
    alias eranger="nvim ~/.dotfiles/ranger/"
    alias ekitty="nvim ~/.dotfiles/kitty/"
    alias eneofetch="nvim ~/.dotfiles/neofetch/"


end

# bun
set --export BUN_INSTALL "$HOME/.local/share/reflex/bun"
set --export PATH $BUN_INSTALL/bin $PATH
