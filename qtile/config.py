#     __
#    /  |
#    $$ |        ______    _______   ______
#    $$ |       /      \  /       | /      \
#    $$ |      /$$$$$$  |/$$$$$$$/ /$$$$$$  |
#    $$ |      $$ |  $$ |$$      \ $$ |  $$ |
#    $$ |_____ $$ \__$$ | $$$$$$  |$$ \__$$ |
#    $$       |$$    $$/ /     $$/ $$    $$ |
#    $$$$$$$$/  $$$$$$/  $$$$$$$/   $$$$$$$ |
#                                  /  \__$$ |
#                                  $$    $$/
#                                   $$$$$$/
#
import os
import subprocess
import iwlib
from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import (
    Click,
    Drag,
    Group,
    Key,
    Match,
    Screen,
)
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"

terminal = guess_terminal()

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod, "control"], "f", lazy.spawn("firefox")),
    Key([mod], "d", lazy.spawn("rofi -show drun")),
    Key([mod, "shift"], "d", lazy.spawn(".config/rofi/open_file.sh")),
    Key([mod], "e", lazy.spawn("thunar")),
    Key([mod], "c", lazy.spawn("speedcrunch")),
    Key([mod], "a", lazy.spawn("ani-cli --rofi -v -q 1080")),
    Key(["mod1", "control"], "a", lazy.spawn("matlab/bin/matlab")),
    Key(
        [],
        "Print",
        lazy.spawn("sh -c 'scrot ~/screenshots/%Y-%m-%d-%T-screenshot.png'"),
    ),
    Key(["mod1", "control"], "l", lazy.spawn("/usr/local/bin/lock.sh")),
    # Sound
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("amixer -D default sset Master 2%- unmute"),
    ),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("amixer -D default sset Master 2%+ unmute"),
    ),
    # Brightness
    # Increase backlight
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s +5%")),
    # Decrease backlight
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key(
        [mod],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),
]


# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

colors = {
    #     Gruvbox
    # "bg": "#282828",
    # "fg": "#ebdbb2",
    # "red": "#fb4934",
    # "green": "#b8bb26",
    # "yellow": "#fabd2f",
    # "blue": "#83a598",
    # "purple": "#d3869b",
    # "cyan": "#8ec07c",  # its actually aqua
    # "orange": "#fe8019",
    # Tokyo Night
    # "bg": "#1a1b26",  # Background
    # "fg": "#a9b1d6",  # Foreground (Text)
    # "red": "#f7768e",  # Red (Error)
    # "green": "#9ece6a",  # Green (Success)
    # "yellow": "#e0af68",  # Yellow (Warning)
    # "blue": "#7aa2f7",  # Blue (Info)
    # "purple": "#ad8ee6",  # Purple (Accent)
    # "cyan": "#449dab",  # Cyan (Secondary Info)
    # "orange": "#ff9e64",  # Orange (Accent)
    # Kanagawa
    # "bg": "#1f1f28",       #  Sumire Black (Background)
    # "fg": "#dcd7ba",       #  Fuji White (Foreground)
    # "red": "#e46876",      #  Sakura Pink (Red)
    # "green": "#98bb6c",    #  Spring Green (Green)
    # "yellow": "#ffa066",   #  Autumn Yellow (Yellow)
    # "blue": "#7e9cd8",     #  Wave Blue (Blue)
    # "purple": "#957fb8",   #  Oni Purple (Purple)
    # "cyan": "#7fb4ca",     #  Surimi Blue (Cyan)
    # "orange": "#e98a35"    #  Koi Carp Orange (Orange)
    # Catppuccin
    # "bg": "#1e1e2e",
    # "fg": "#cdd6f4",
    # "red": "#f38ba8",
    # "green": "#a6e3a1",
    # "yellow": "#f9e2af",
    # "blue": "#89dceb",
    # "purple": "#cba6f7",
    # "cyan": "#94e2d5",
    # "orange": "#fab387",
    # OneDark (Warmer)
    # "bg": "#232326",
    # "fg": "#a7aab0",
    # "red": "#de5d68",
    # "green": "#8fb573",
    # "yellow": "#dbb671",
    # "blue": "#57a5e5",
    # "purple": "#bb70d2",
    # "cyan": "#51a8b3",
    # "orange": "#c49060",
    # OneDark 
    "bg": "#282c34",
    "fg": "#abb2bf",
    "red": "#e86671",
    "green": "#98c379",
    "yellow": "#e5c07b",
    "blue": "#61afef",
    "purple": "#c678dd",
    "cyan": "#56b6c2",
    "orange": "#d19a66",
}

layout_theme = {
    "border_width": 3,
    "margin": 0,
    "border_focus": colors["fg"],
    "border_normal": colors["bg"],
}

layouts = [
    layout.Columns(**layout_theme),
    layout.Max(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.MonadTall(**layout_theme),
    # layout.MonadWide(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.Tile(**layout_theme),
    # layout.TreeTab(**layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.Zoomy(**layout_theme),
    # layout.ScreenSplit(**layout_theme),
    # layout.Plasma(**layout_theme),
    # layout.Spiral(**layout_theme),
]

widget_defaults = dict(
    font="Ubunto bold",
    fontsize=12,
    padding=0,
)

extension_defaults = widget_defaults.copy()
# separator = widget.TextBox(text=" ", padding=5)
red_arrow = widget.TextBox(
    text="🞀",
    foreground=colors["red"],
    background=colors["bg"],
    fontsize=37,
)

bg_arrow = widget.TextBox(
    text="🞀",
    foreground=colors["bg"],
    background=colors["red"],
    fontsize=37,
)
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    fontsize=14,
                    margin_y=3,
                    margin_x=3,
                    padding_y=5,
                    padding_x=5,
                    borderwidth=3,
                    active=colors["red"],
                    inactive=colors["fg"],
                    highlight_method="line",
                    highlight_color=[colors["bg"], colors["bg"]],
                    this_current_screen_border=colors["fg"],
                    this_screen_border=colors["red"],
                    other_current_screen_border=colors["green"],
                    other_screen_border=colors["blue"],
                    urgent_border=colors["red"],
                    background=colors["bg"],
                    fontweight="bold",
                ),
                widget.Prompt(),
                widget.Spacer(),
                red_arrow,
                widget.Volume(
                    fmt="Vol: {}",
                    foreground=colors["bg"],
                    background=colors["red"],
                ),
                bg_arrow,
                widget.Battery(
                    format="{char}{percent:2.0%} {hour:d}:{min:02d}",
                    foreground=colors["fg"],
                    background=colors["bg"],
                ),
                red_arrow,
                widget.Backlight(
                    backlight_name="nvidia_wmi_ec_backlight",  # Replace with your actual device name
                    brightness_file="/sys/class/backlight/nvidia_wmi_ec_backlight/brightness",
                    max_brightness_file="/sys/class/backlight/nvidia_wmi_ec_backlight/max_brightness",
                    change_command="brightnessctl s {0}%",  # Command to change brightness
                    format="brightness: {percent:2.0%}",
                    foreground=colors["bg"],
                    background=colors["red"],
                ),
                bg_arrow,
                widget.CPU(
                    format="CPU: {load_percent}%",
                    foreground=colors["fg"],
                    background=colors["bg"],
                ),
                red_arrow,
                widget.Memory(
                    format="Mem: {MemUsed:.1f} GB/{MemTotal:.1f} GB",
                    foreground=colors["bg"],
                    background=colors["red"],
                    measure_mem="G",
                ),
                bg_arrow,
                widget.Wlan(
                    format="直 {essid} ",
                    disconnected_message="睊  Disconnected",
                    foreground=colors["fg"],
                    background=colors["bg"],
                ),
                widget.Net(
                    format="{down:.0f}{down_suffix} ↓↑ {up:.0f}{up_suffix}",
                    foreground=colors["fg"],
                    background=colors["bg"],
                ),
                widget.Systray(
                    background=colors["red"],
                    icon_size=20,
                    padding=5,
                ),
                red_arrow,
                widget.Clock(
                    format="  %a %d/%m/%y",
                    foreground=colors["bg"],
                    background=colors["red"],
                ),
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    foreground=colors["bg"],
                    background=colors["red"],
                ),
            ],
            24,
            background=colors["bg"],
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    fontsize=14,
                    margin_y=3,
                    margin_x=3,
                    padding_y=5,
                    padding_x=5,
                    borderwidth=3,
                    active=colors["yellow"],
                    inactive=colors["fg"],
                    highlight_method="line",
                    highlight_color=[colors["bg"], colors["bg"]],
                    this_current_screen_border=colors["yellow"],
                    this_screen_border=colors["red"],
                    other_current_screen_border=colors["green"],
                    other_screen_border=colors["blue"],
                    urgent_border=colors["red"],
                    background=colors["bg"],
                ),
                widget.Spacer(),
                widget.Volume(
                    fmt="Vol: {}",
                    foreground=colors["yellow"],
                    background=colors["bg"],
                ),
                widget.Battery(
                    format="{char}{percent:2.0%} {hour:d}:{min:02d}",
                    foreground=colors["green"],
                    background=colors["bg"],
                ),
                widget.CPU(
                    format="CPU: {load_percent}%",
                    foreground=colors["red"],
                    background=colors["bg"],
                ),
                widget.Memory(
                    format="Mem: {MemUsed:.1f} GB/{MemTotal:.1f} GB",
                    foreground=colors["purple"],
                    background=colors["bg"],
                    measure_mem="G",
                ),
                widget.Wlan(
                    format="{essid} {percent:2.0%}",
                    foreground=colors["cyan"],
                    background=colors["bg"],
                ),
                widget.Net(
                    format="{down:.0f}{down_suffix} ↓↑ {up:.0f}{up_suffix}",
                    foreground=colors["cyan"],
                    background=colors["bg"],
                ),
                widget.Clock(
                    format="%d-%m-%Y %a %H:%M",
                    foreground=colors["orange"],
                    background=colors["bg"],
                    fontsize=14,
                ),
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    foreground=colors["fg"],
                    background=colors["bg"],
                ),
            ],
            24,
            background=colors["bg"],
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="Lxqt-policykit-agent"),
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None
wl_xcursor_size = 24


@hook.subscribe.startup_once
def autostart():
    autostartscript = "~/.config/qtile/autostart.sh"
    home = os.path.expanduser(autostartscript)
    subprocess.Popen([home])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
