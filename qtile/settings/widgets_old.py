from libqtile import widget, bar
from libqtile.config import Screen
from .theme import themes



# color_bar = "#282a36"
color_bar = "#24283B"
size_bar = 23
# system_font = "CaskaydiaCove Nerd Font"
system_font = "JetBrains Mono Bold"
widget_font_size = 13
active_color = "#d8dee9"
inactive_color = "#4C566A"
icon_size = 20
groups_font_size = 15
fg_color = "#ffffff"
bg_color = "#24283B"
dark_color = "#212121"
light_color = "#5e81ac"
urgent_color = "#ff5555"
text1_color = "#5e81ac"
update_color = "#a68bf0"
red_interface = "wlo1" 
group_update = "#b48ead"
group_color_1 = "#8fbcbb"
group_color_2 = "#88c0d0"
group_color_3 = "#81a1c1"
group_color_4 = "#5e81ac"
bar_border_color = "#5e81ac"

def separation():
  return widget.Sep(
    linewidth = 0,
    padding = 6,
    foregroud = fg_color,
    background = bg_color
  )

# left half circle (0) right half circle (1)
def half_circle(vColor, kind):
  if kind == 0:
    icon = "" # nf-ple-left_half_circle_thick
  else:
    icon = "" # nf-ple-right_half_circle_thick
  return widget.TextBox(
    text = icon,
    fontsize = size_bar,
    foreground = vColor,
    background = bg_color,
    padding = -5
  )

# text or icon
def icons(icon, group_color):
  return widget.TextBox(
    text = icon,
    foreground = fg_color,
    background = group_color,
    fontsize = icon_size
  )



widget_defaults = dict(
    font  = system_font,
    fontsize  = widget_font_size,
    padding = 1,
)
extension_defaults = widget_defaults.copy()

screens = [
  Screen(
    top=bar.Bar(
      [
        widget.GroupBox(
          active = active_color,
          rounded = False,
          inactive = inactive_color,
          border_width = 0,
          disable_drag = True,
          fontsize = groups_font_size,
          foreground = fg_color,
          highlight_method = 'block',
          margin_x = 0,
          margin_y = 3,
          other_current_screen_border = dark_color,
          other_screen_border = dark_color,
          padding_x = 5,
          padding_y = 10,
          this_current_screen_border = light_color,
          this_screen_border = light_color,
          urgent_alert_method = 'block',
          urgent_border = urgent_color,
        ),
        separation(),
        widget.Prompt(),
        widget.WindowName(
          foreground = text1_color,
          background = bg_color
        ),
        separation(),

        # Update group
        half_circle(group_update, 0),
        icons("󰭽 ", group_update), # nf-fa-cloud_download
        widget.CheckUpdates(
          distro = 'Arch_checkupdates',
          update_interval = 900,
          display_format = '{updates}',
          no_update_string = '0',
          background = group_update,
          execute = 'alacritty -e sudo pacman -Syyu'
        ),
        half_circle(group_update, 1),
        separation(),

        # Group 1
        half_circle(group_color_1, 0),
        widget.DF(
          visible_on_warn = False,
          partition = '/home/volg',
          format = 'Home {uf}{m} |',
          foreground = fg_color,
          background = group_color_1
        ),
        widget.DF(
          visible_on_warn = False,
          partition = '/',
          format = 'Root {uf}{m}',
          foreground = fg_color,
          background = group_color_1
        ),
        half_circle(group_color_1, 1),
        separation(),
        # End Group 1

        # Group 2
        half_circle(group_color_2, 0),
        # widget.TextBox(
        #   text = 'wlo1',
        #   background = group_color_2
        # ),
        widget.Net(
          interface = 'wlo1',
          # prefix = 'M',
          format = '{interface}: {down:6.2f}{down_suffix:<2}    {up:6.2f}{up_suffix:<2}',
          use_bits = False,
          background = group_color_2

        ),
        half_circle(group_color_2, 1),
        separation(),
        # End Group 2
        # Gruop 3
        half_circle(group_color_3, 0),
        widget.Clock(
          background = group_color_3,
          foreground = fg_color,
          format="%Y/%m/%d %I:%M %p"
        ),
        half_circle(group_color_3, 1),
        separation(),
        # End Group 3

        # Group 4
        half_circle(group_color_4, 0),
        widget.CurrentLayoutIcon(
          background = group_color_4,
          scale = 0.7
        ),
        widget.CurrentLayout(
          background = group_color_4,
        ),
        half_circle(group_color_4, 1),
        separation(),
        # End Group 4
        widget.Systray(
            icon_size = icon_size,
            background = bg_color,
        ),
        separation(),

      ],

      size_bar,
      background = color_bar,
      border_width = 2,
      opacity = 0.8,
      border_color = bar_border_color,
      reserve = True,
    ),
  ),
]
