import os
from random import choice

# wallpapers_path = os.path.expanduser("/home/losg/Pictures/tokyo_night")
# wallpapers_path = os.path.expanduser("/home/losg/Pictures/gruvbox")
# wallpapers_path = os.path.expanduser("/home/losg/Pictures/kanagawa")
# wallpapers_path = os.path.expanduser("/home/losg/Pictures/catppuccin")
# wallpapers_path = os.path.expanduser("/home/losg/Pictures/onedark")
wallpapers_path = os.path.expanduser("/home/losg/Pictures/Wallpapers")


def pick_wallpaper():
    walls_list = os.listdir(wallpapers_path)
    wallpaper = choice(walls_list)
    path = os.path.join(wallpapers_path, wallpaper)
    os.system(f"nitrogen --set-scaled --save {path}")


if __name__ == "__main__":
    pick_wallpaper()
