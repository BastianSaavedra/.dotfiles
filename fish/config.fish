if status is-interactive
    # Commands to run in interactive sessions can go here
    alias sscrot="scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png"
    set -gx PATH /usr/local/bin $PATH
    # python alias
    alias pyvenv="python3 ~/.dotfiles/scripts/create_venv.py"
    alias activate="source .venv/bin/activate.fish"
    # Django
    alias startproject="django-admin startproject"
    alias startapp="python manage.py startapp"
    alias makemigrations="python manage.py makemigrations"
    alias migrate="python manage.py migrate"
    alias run-django="python manage.py runserver"

    # git token alias
    alias token="cat ~/pCloudDrive/Workspace/Utilities/Tokens/git_token.txt | xclip -selection clipboard"

    # edit alias
    alias eqtile="nvim ~/.dotfiles/qtile/"
    alias envim="nvim ~/.dotfiles/nvim/"
    alias ealacritty="nvim ~/.dotfiles/alacritty/"
    alias erofi="nvim ~/.dotfiles/rofi/"
    alias efish="nvim ~/.dotfiles/fish/"
    alias eranger="nvim ~/.dotfiles/ranger/"
    alias ekitty="nvim ~/.dotfiles/kitty/"
    alias eneofetch="nvim ~/.dotfiles/neofetch/"

    # pgadmin
    alias run-pgadmin="source ~/Tools/pgadmin4/bin/activate.fish && pgadmin4"



end

# bun
set --export BUN_INSTALL "$HOME/.local/share/reflex/bun"
set --export PATH $BUN_INSTALL/bin $PATH
set -gx EDITOR nvim



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/none/anaconda3/bin/conda
    eval /home/none/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/none/anaconda3/etc/fish/conf.d/conda.fish"
        . "/home/none/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/none/anaconda3/bin" $PATH
    end
end
conda deactivate
# <<< conda initialize <<<


# Created by `pipx` on 2024-08-28 23:23:31
set PATH $PATH /home/none/.local/bin
