import os
import subprocess

from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy


#
# Helper vars
#

bar_height = 32

colors = {
    "background": "#1f2024",
    "base": "#0f1012",
    "foreground": "#cdd6f4",
    "highlight": "#3d3f47",
}

fonts = {
    "main": "Inter Bold",
    "icons": "JetBrainsMono Nerd Font",
    "title": "Inter",
}

mod = "mod4"

terminal = "alacritty"

widget_defaults = {
    "font": fonts["main"],
    "fontsize": 15,
    "padding": 2,
}
extension_defaults = widget_defaults.copy()


#
# Controls
#

keys = [
    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%"), desc="Increase brightness"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-"), desc="Decrease brightness"),
    # Media
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc="Play/pause media"),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="Go to next track"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="Go to previous track"),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"), desc="Mute output"),
    Key([], "XF86AudioMicMute", lazy.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), desc="Mute microphone"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"), desc="Raise volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"), desc="Lower volume"),
    # Misc
    Key([mod], "d", lazy.spawn("rofi -show drun"), desc="Open menu"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Open terminal"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    # Switch between windows
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]


#
# Workspaces & layouts
#

groups = [Group(i) for i in "123456789"]
for i in groups:
    keys.extend(
        [
            Key([mod], i.name, lazy.group[i.name].toscreen(), desc=f"Switch to group {i.name}"),
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True), desc=f"Switch to & move focused window to group {i.name}"),
        ]
    )

layouts = [
    layout.Columns(
        border_focus=colors["foreground"],
        border_normal=colors["base"],
        border_width=1,
        insert_position=1,
    ),
    layout.Max(),
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
    ]
)


#
# Screens
#

add_space = lambda size: widget.Spacer(size)
spaces = {"left": 10, "between": 16, "right": 16}

screens = [
    Screen(
        top=bar.Bar(
            [
                # Left side
                add_space(spaces["left"]),
                widget.CurrentLayoutIcon(scale=0.5),
                add_space(spaces["left"]),
                widget.GroupBox(disable_drag=True, hide_unused=True, highlight_method="block", inactive=colors["foreground"], padding_x=12, this_current_screen_border=colors["highlight"]),
                add_space(spaces["between"]),
                widget.WindowName(font=fonts["title"], fontsize=14),
                # Stretchable spacer
                widget.Spacer(),
                # Right side
                widget.Systray(padding=16),
                add_space(spaces["between"]),
                widget.TextBox(fmt=" 蓼", font=fonts["icons"]),
                widget.Volume(step=5),
                add_space(spaces["between"]),
                widget.Battery(font=fonts["icons"], format="{char}", show_short_text=False, charge_char="ﮣ", discharge_char="", empty_char="", full_char="ﮣ"),
                widget.Battery(format="{percent:2.0%}", show_short_text=False),
                add_space(spaces["between"]),
                widget.TextBox(fmt=" ", font=fonts["icons"]),
                widget.Clock(format="%b %-d, %H:%M"),
                add_space(spaces["right"]),
            ],
            bar_height,
            background=colors["base"],
            border_width=[0, 0, 1, 0],
        ),
        wallpaper="/home/ruir/Pictures/Wallpapers/evening-sky.png",
        wallpaper_mode="fill",
    ),
]


#
# Misc. settings
#

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"


#
# Hooks
#


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.Popen([home])
