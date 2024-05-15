from libqtile import widget, bar
from libqtile.config import Screen
import os

## Themes
nord = {
    "background": "2e3440",
    "foreground": "d8dee9",
    "black" : "3b4252",
    "blue" : "81a1c1",
    "cyan" : "88c0d0",
    "green" : "a3be8c",
    "magenta" : "b48ead",
    "red" : "bf616a",
    "white" : "e5e9f0",
    "yellow" : "ebcb8b"
}

theme = nord

def sep():
    return widget.Sep(
        linewidth = 0,
        padding = 15,
        background = theme["background"],
        foreground = theme["foreground"]
    )


widget_defaults = dict(
    font = "JetBrains Mono Bold",
    fontsize = 13,
    padding = 1,
)

extension_defaults = widget_defaults.copy()

icon = lambda char, foreground, background: widget.TextBox(
    font = "Font Awesome 6 Free Solid",
    text = char,
    background = background,
    foreground = foreground,
)

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active = theme["white"],
                    inactive = theme["black"],
                    rounded = False,
                    fontsize = 15,
                    border_width = 0,
                    disable_drag = True,
                    foreground = theme["foreground"],
                    background = theme["background"],
                    other_current_screen_border = theme["black"],
                    other_screen_border = theme["black"],
                    margin_x = 0,
                    margin_y = 3,
                    padding_x = 5,
                    padding_y = 10,
                    this_current_screen_border = theme["blue"],
                    this_screen_border = theme["cyan"],
                    highlight_method = 'block',
                    urgent_border = theme["red"],
                ),
                sep(),
                widget.Prompt(),
                widget.WindowName(
                    foreground = theme["blue"],
                    background = theme["background"]
                ),
                sep(),
                icon(
                    "\uf021 ", 
                    background=theme['background'],
                    foreground=theme["cyan"]
                ),
                widget.CheckUpdates(
                    distro = "Arch_checkupdates",
                    update_interval = 900,
                    display_format = "{updates}", # nf-fa-cloud_download
                    no_update_string = "0",
                    colour_no_updates = theme["cyan"],
                    colour_have_updates = theme["cyan"],
                    execute = "alacritty -e sudo pacman -Syyu"
                ),
                sep(),
                icon(
                    " ",
                    background = theme["background"],
                    foreground = theme["green"]
                ),
                widget.DF(
                  visible_on_warn = False,
                  partition = '/home/volg',
                  format = 'Home {uf}{m} |',
                  foreground = theme["green"],
                ),
                widget.DF(
                  visible_on_warn = False,
                  partition = '/',
                  format = 'Root {uf}{m}',
                  foreground = theme["green"],
                ),
                sep(),
                widget.Net(
                  interface = 'wlo1',
                  # prefix = 'M',
                  format = '{interface}: {down:6.2f}{down_suffix:<2}    {up:6.2f}{up_suffix:<2}',
                  use_bits = False,
                  foreground = theme["magenta"]
                ),
                sep(),
                icon(
                    "󰥔 ",
                    background = theme["background"],
                    foreground = theme["red"]
                ),
                widget.Clock(
                  background = theme["background"],
                  foreground = theme["red"],
                  format="%B %-d, %R"
                ),
                sep(),
                widget.CurrentLayoutIcon(
                    custom_icon_paths = [
                        os.path.expanduser(
                            "~/.dotfiles/qtile/settings/icons"
                        )
                    ],
                    background = theme["background"],
                    scale = 0.7,
                    padding = 10
                ),
                widget.CurrentLayout(
                    background = theme["background"],
                    foreground = theme["yellow"]
                ),
                sep(),
                widget.Systray(
                    icon_size = 15,
                    background = theme["background"],
                    padding = 5
                ),
                sep(),
                icon(
                    "󰌌 ",
                    background = theme["background"],
                    foreground = theme["white"]
                ),
                widget.KeyboardLayout(
                    configured_keyboards = [ 'us', 'latam' ],
                    display_map = { 'us': 'us', 'latam': 'es' },
                    foreground = theme["white"],
                    fontsize = 13,
                ),
                sep()
            ],
            23,
            background = theme["background"],
            opacity = 0.8,

        ),

    ),
    
]
