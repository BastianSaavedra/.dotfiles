# Imports
import os
import subprocess
from libqtile import hook

# import settings
from settings.groups import groups
from settings.keys import mod, keys
from settings.layouts import layouts, floating_layout
from settings.widgets import widget_defaults, extension_defaults, screens
from settings.mouse import mouse
from libqtile.utils import guess_terminal

# terminal = guess_terminal()
terminal = "kitty"

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
  home = os.path.expanduser('~')
  subprocess.Popen(home + '/.config/qtile/scripts/autostart.sh')

wmname = "LG3D"
