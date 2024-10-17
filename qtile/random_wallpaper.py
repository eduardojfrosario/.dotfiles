import os
from random import choice

# wallpapers_path = os.path.expanduser("~/Pictures/tokyo_night")
# wallpapers_path = os.path.expanduser("~/Pictures/gruvbox")
# wallpapers_path = os.path.expanduser("~/Pictures/kanagawa")
# wallpapers_path = os.path.expanduser("~/Pictures/catppuccin")
wallpapers_path = os.path.expanduser("~/Pictures/Wallpapers")


def pick_wallpaper():
    walls_list = os.listdir(wallpapers_path)
    wallpaper = choice(walls_list)
    path = os.path.join(wallpapers_path, wallpaper)
    os.system(f"nitrogen --set-scaled --save {path}")


if __name__ == "__main__":
    pick_wallpaper()
