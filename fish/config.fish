if status is-interactive
    # Commands to run in interactive sessions can go here
  alias sscrot="scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png"
  set -gx PATH /usr/local/bin $PATH
  alias pyvenv="python3 -m virtualenv"
  alias activate="source venv/bin/activate.fish"
  alias token="cat ~/pCloudDrive/Workspace/Utilities/Tokens/git_token.txt | xclip -selection clipboard"

end
