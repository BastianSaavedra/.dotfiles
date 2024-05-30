if status is-interactive
    # Commands to run in interactive sessions can go here
  alias sscrot="scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png"
  set -gx PATH /usr/local/bin $PATH
  alias pyvenv="python3 -m venv"
  alias activate="source venv/bin/activate.fish"
  alias token="cat ~/pCloudDrive/Workspace/Utilities/Tokens/git_token.txt | xclip -selection clipboard"
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
