from libqtile import layout
from libqtile.config import Match

def init_layout_theme():
  return {
    "margin": 7,
    "border_width": 3,
    "border_radius": 5,
    "border_focus": "#5e81ac",
    "border_normal": "#4c566a"
  }

layout_theme = init_layout_theme()

layouts = [
  layout.Max(**layout_theme),
  layout.MonadTall(**layout_theme),
  layout.Columns(**layout_theme),
  # layout.Stack(num_stacks=2),
  # layout.Bsp(),
  # layout.Matrix(),
  # layout.MonadWide(),
  # layout.RatioTile(),
  # layout.Tile(),
  # layout.TreeTab(),
  # layout.VerticalTile(),
  # layout.Zoomy(),
]

floating_layout = layout.Floating(
  float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class="confirmreset"),  # gitk
    Match(wm_class="makebranch"),  # gitk
    Match(wm_class="maketag"),  # gitk
    Match(wm_class="ssh-askpass"),  # ssh-askpass
    Match(title="branchdialog"),  # gitk
    Match(title="pinentry"),  # GPG key password entry
  ],
  border_focus = "#5e81ac",
)
