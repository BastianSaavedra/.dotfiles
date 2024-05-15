from libqtile.config import Key
from libqtile.command import lazy

mod = "mod4"
alt = "mod1"


keys = [


    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "l", lazy.layout.grow(), desc="Grow window"),
    Key([mod, "control"], "h", lazy.layout.shrink(), desc="Shrink window"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(
      [mod],
      "f",
      lazy.window.toggle_fullscreen(),
      desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    Key([alt, "control"], "h", lazy.window.move_down()),


    ## My Key ##

    # Switch focus of monitor
    Key([mod], "period", lazy.next_screen()),
    Key([mod], "comma", lazy.prev_screen()),

    # Change Language
    
    Key([mod, "shift"], "e", lazy.spawn("setxkbmap latam"), desc="Spanish Language"),
    Key([mod, "shift"], "i", lazy.spawn("setxkbmap us"), desc="English Language"),
    Key([mod], "space", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next Keyboard Layout"),

    ## Application Keys 

    # Terminal
    Key([mod], "Return", lazy.spawn("alacritty"), desc="Launch terminal"),

    # Rofi
    Key([mod], "m", lazy.spawn("rofi -show drun"), desc="Open rofi's menu"),
    Key([alt, "shift"], "w", lazy.spawn("rofi -show window"), desc="Open Windows"),
    Key([alt, "shift"], "r", lazy.spawn("rofi -show run"), desc="Run code terminal"),
    Key([alt, "shift"], "f", lazy.spawn("rofi -show filebrowser")),


    # Browser
    Key([mod], "b", lazy.spawn("firefox"), desc="Launch Browser"),

    # File Explorer
    Key([mod], "f", lazy.spawn("thunar"), desc="Open file explorer"),

    # Spotify
    # Key([alt, "control"], "s", lazy.spawn("spotify-launcher"), desc="Launch Spotify"),

    # Discord
    # Key([alt, "control"], "d", lazy.spawn("discord"), desc="Launch Discord"),

    # Task Manager
    Key([alt, "control"], "t", lazy.spawn("bashtop"), desc="Launch task manager"),

    # Pick Color
    Key([alt, "shift"], "p", lazy.spawn("gpick"), desc="Pick color"),

    # Volumen 
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer sset Master 10%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer sset Master 10%+")),
    Key([], "XF86AudioMute", lazy.spawn("amixer sset Master 1+ toggle")),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%"), desc="Increase brightness"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-"), desc="Lower brightness"),

    # Play/Stop Next and Prev 
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),

    # Screenshot
    Key([mod], "s", lazy.spawn("scrot '%Y-%m-%d-%s_screenshot_$wx$h.jpg' -e 'mv $f $$(xdg-user-dir PICTURES)/Screenshots'")),
    Key([mod, "shift"], "s", lazy.spawn("scrot -s '%Y-%m-%d-%s_selected_screenshot_$wx$h.jpg' -e 'mv $f $$(xdg-user-dir PICTURES)/Screenshots'")),
]
