import os

from libqtile import bar, widget
from libqtile.config import Screen

from .theme import colors

terminal = "kitty"
interface = "wlan0"

theme = colors


def base(fg="foreground", bg="background"):
    return {"foreground": theme[fg], "background": theme[bg]}


def sep():
    return widget.Sep(
        **base(),
        linewidth=0,
        padding=15,
    )


widget_defaults = dict(
    font="JetBrains Mono Bold",
    fontsize=13,
    padding=1,
)

extension_defaults = widget_defaults.copy()

icon = lambda char, foreground, background: widget.TextBox(
    font="JetBrains Mono Bold",
    text=char,
    background=background,
    foreground=foreground,
)

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active=theme["white"],
                    inactive=theme["black"],
                    rounded=False,
                    fontsize=15,
                    border_width=0,
                    disable_drag=True,
                    foreground=theme["foreground"],
                    background=theme["background"],
                    other_current_screen_border=theme["black"],
                    other_screen_border=theme["black"],
                    margin_x=0,
                    margin_y=3,
                    padding_x=5,
                    padding_y=10,
                    this_current_screen_border=theme["blue"],
                    this_screen_border=theme["magenta"],
                    highlight_method="block",
                    urgent_border=theme["red"],
                ),
                sep(),
                widget.Prompt(),
                widget.WindowName(
                    foreground=theme["blue"],
                    background=theme["background"],
                    font="JetBrains Mono Bold",
                ),
                sep(),
                icon(
                    "\uf021 ", background=theme["background"], foreground=theme["cyan"]
                ),
                # Install pacman-contrib for this widget
                widget.CheckUpdates(
                    distro="Arch_checkupdates",
                    update_interval=900,
                    display_format="{updates}",  # nf-fa-cloud_download
                    no_update_string="0",
                    colour_no_updates=theme["cyan"],
                    colour_have_updates=theme["cyan"],
                    execute=f"{terminal} -e sudo pacman -Syyu",
                ),
                sep(),
                icon(" ", background=theme["background"], foreground=theme["green"]),
                widget.DF(
                    visible_on_warn=False,
                    partition="/home/none",
                    format="home {uf}{m}|",
                    foreground=theme["green"],
                ),
                widget.DF(
                    visible_on_warn=False,
                    partition="/",
                    format="root {uf}{m}",
                    foreground=theme["green"],
                ),
                sep(),
                widget.Net(
                    interface=interface,
                    # prefix = 'M',
                    format="{interface}: {down:6.2f}{down_suffix:<2}    {up:6.2f}{up_suffix:<2}",
                    use_bits=False,
                    foreground=theme["magenta"],
                ),
                sep(),
                icon("󰥔 ", background=theme["background"], foreground=theme["red"]),
                widget.Clock(
                    background=theme["background"],
                    foreground=theme["red"],
                    format="%B %-d, %R",
                ),
                sep(),
                widget.CurrentLayoutIcon(
                    custom_icon_paths=[
                        os.path.expanduser("~/.dotfiles/qtile/settings/icons")
                    ],
                    background=theme["background"],
                    scale=0.7,
                    padding=10,
                ),
                widget.CurrentLayout(
                    background=theme["background"], foreground=theme["yellow"]
                ),
                sep(),
                widget.Systray(icon_size=15, background=theme["background"], padding=5),
                sep(),
                icon("󰌌 ", background=theme["background"], foreground=theme["white"]),
                widget.KeyboardLayout(
                    configured_keyboards=["us", "latam"],
                    display_map={"us": "us", "latam": "es"},
                    foreground=theme["white"],
                    fontsize=13,
                ),
                sep(),
                widget.CurrentScreen(
                    background=theme["background"],
                    active_color=theme["green"],
                    active_text="󰍹 ",
                    inactive_color=theme["red"],
                    inactive_text="󰍹 ",
                ),
                sep(),
            ],
            23,
            background=theme["background"],
            opacity=0.8,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active=theme["white"],
                    inactive=theme["black"],
                    rounded=False,
                    fontsize=15,
                    border_width=0,
                    disable_drag=True,
                    foreground=theme["foreground"],
                    background=theme["background"],
                    other_current_screen_border=theme["black"],
                    other_screen_border=theme["black"],
                    margin_x=0,
                    margin_y=3,
                    padding_x=5,
                    padding_y=10,
                    this_current_screen_border=theme["blue"],
                    this_screen_border=theme["magenta"],
                    highlight_method="block",
                    urgent_border=theme["red"],
                ),
                sep(),
                widget.CurrentScreen(
                    background=theme["background"],
                    active_color=theme["green"],
                    active_text="󰍹 ",
                    inactive_color=theme["red"],
                    inactive_text="󰍹 ",
                ),
                sep(),
            ],
            23,
            background=theme["background"],
            opactity=0.8,
        )
    ),
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active=theme["white"],
                    inactive=theme["black"],
                    rounded=False,
                    fontsize=15,
                    border_width=0,
                    disable_drag=True,
                    foreground=theme["foreground"],
                    background=theme["background"],
                    other_current_screen_border=theme["black"],
                    other_screen_border=theme["black"],
                    margin_x=0,
                    margin_y=3,
                    padding_x=5,
                    padding_y=10,
                    this_current_screen_border=theme["blue"],
                    this_screen_border=theme["magenta"],
                    highlight_method="block",
                    urgent_border=theme["red"],
                ),
                sep(),
                widget.CurrentScreen(
                    background=theme["background"],
                    active_color=theme["green"],
                    active_text="󰍹 ",
                    inactive_color=theme["red"],
                    inactive_text="󰍹 ",
                ),
                sep(),
            ],
            23,
            background=theme["background"],
            opactity=0.8,
        )
    ),
]
