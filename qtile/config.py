# Imports
import os
import subprocess

from libqtile import hook
from libqtile.utils import guess_terminal

# import settings
from settings.groups import groups
from settings.keys import keys, mod
from settings.layouts import floating_layout, layouts
from settings.mouse import mouse
from settings.screens import screens
from settings.widgets import extension_defaults, widget_defaults

terminal = guess_terminal()
# terminal = "kitty"

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~")
    subprocess.Popen(home + "/.dotfiles/qtile/scripts/autostart.sh")


wmname = "LG3D"
