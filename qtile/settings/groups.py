from libqtile.config import Key, Group
from libqtile import qtile
# from libqtile.command import lazy
from libqtile.lazy import lazy
from .keys import mod, keys

for vt in range(1, 8):
  keys.append(
    Key(
      ["control", "mod1"],
      f"f{vt}",
      lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
      desc=f"Switch to VT{vt}",
    )
  )

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
groups = [Group(i) for i in [
  "  ", "  ", "  ", "  ", "  ", "  ", " 󰙯 " # Moon workspace
]]

for i, group in enumerate(groups):
  actual_key = str(i + 1)
  keys.extend(
    [
      # mod1 + letter of group = switch to group
      Key([mod], actual_key, lazy.group[group.name].toscreen()),
      # mod1 + shift + letter of group = switch to & move focused window
      # to group
      Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ]
  )
