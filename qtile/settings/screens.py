# Multimonitor support

import subprocess

from libqtile import bar
from libqtile.config import Screen
from libqtile.log_utils import logger

from .theme import colors
from .widgets import (
    primary_screen_widgets,
    secondary_sreen_widgets,
    third_sreen_widgets,
)


def status_bar(widgets):
    return bar.Bar(widgets, 23, background=colors["background"], opacity=0.8)


screens = [Screen(top=status_bar(primary_screen_widgets))]

xrandr = "xrandr | grep -w 'connected' | cut -d ' ' -f 2 | wc -l"

command = subprocess.run(
    xrandr,
    shell=True,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
)

if command.returncode != 0:
    error = command.stderr.decode("UTF-8")
    logger.error(f"Failed counting monitors using {xrandr}:\n{error}")
    connected_monitors = 1
else:
    connected_monitors = int(command.stdout.decode("UTF-8"))

if connected_monitors > 1:
    screens.append(Screen(top=status_bar(secondary_sreen_widgets)))
    screens.append(Screen(top=status_bar(third_sreen_widgets)))
