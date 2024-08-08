import os

from libqtile import widget

from scripts.get_interface import get_active_network_interface

from .custom_widget import ModdedCapsNumLock
from .theme import colors

terminal = "kitty"
interface = get_active_network_interface()

theme = colors


def base(fg="foreground", bg="background"):
    return {"foreground": theme[fg], "background": theme[bg]}


def separator():
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


def widget_base():
    return [
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
        separator(),
        widget.WindowName(
            foreground=theme["blue"],
            background=theme["background"],
            font="JetBrains Mono Bold",
        ),
        separator(),
    ]


primary_screen_widgets = [
    *widget_base(),
    ModdedCapsNumLock(foreground=theme["green"]),
    separator(),
    icon("\uf021 ", background=theme["background"], foreground=theme["cyan"]),
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
    separator(),
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
    separator(),
    widget.Net(
        interface=interface,
        # prefix = 'M',
        format="{interface}: {down:6.2f}{down_suffix:<2}    {up:6.2f}{up_suffix:<2}",
        use_bits=False,
        foreground=theme["magenta"],
        update_interval=0.5,
    ),
    separator(),
    icon("󰥔 ", background=theme["background"], foreground=theme["red"]),
    widget.Clock(
        background=theme["background"],
        foreground=theme["red"],
        format="%B %-d, %R",
    ),
    separator(),
    widget.CurrentLayoutIcon(
        custom_icon_paths=[os.path.expanduser("~/.dotfiles/qtile/settings/icons")],
        background=theme["background"],
        scale=0.7,
        padding=10,
    ),
    widget.CurrentLayout(background=theme["background"], foreground=theme["yellow"]),
    separator(),
    widget.Systray(icon_size=15, background=theme["background"], padding=5),
    separator(),
    icon("󰌌 ", background=theme["background"], foreground=theme["white"]),
    widget.KeyboardLayout(
        configured_keyboards=["us", "latam"],
        display_map={"us": "us", "latam": "es"},
        foreground=theme["white"],
        fontsize=13,
    ),
    separator(),
    widget.CurrentScreen(
        background=theme["background"],
        active_color=theme["green"],
        active_text="󰍹 ",
        inactive_color=theme["red"],
        inactive_text="󰍹 ",
    ),
    separator(),
]

secondary_sreen_widgets = [
    *widget_base(),
    widget.CurrentScreen(
        background=theme["background"],
        active_color=theme["green"],
        active_text="󰍹 ",
        inactive_color=theme["red"],
        inactive_text="󰍹 ",
    ),
    separator(),
]

third_sreen_widgets = [
    *widget_base(),
    widget.CurrentScreen(
        background=theme["background"],
        active_color=theme["green"],
        active_text="󰍹 ",
        inactive_color=theme["red"],
        inactive_text="󰍹 ",
    ),
    separator(),
]
