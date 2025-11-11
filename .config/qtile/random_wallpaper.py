import os
from random import choice

nitrogen_cfg = os.path.expanduser("/home/losg/.config/nitrogen/bg-saved.cfg")

# wallpapers_path = os.path.expanduser("/home/losg/Pictures/tokyo_night")
# wallpapers_path = os.path.expanduser("/home/losg/Pictures/gruvbox")
wallpapers_path = os.path.expanduser("/home/losg/Pictures/kanagawa")
# wallpapers_path = os.path.expanduser("/home/losg/Pictures/catppuccin")
# wallpapers_path = os.path.expanduser("/home/losg/Pictures/onedark")
# wallpapers_path = os.path.expanduser("/home/losg/Pictures/Wallpapers")

def get_current():
    with open(nitrogen_cfg, "r") as f:
        for line in f:
            line = line.strip()
            if line.startswith("file="):
                return (line.split("=", 1)[1].strip())

def pick_wallpaper():
    path = get_current()
    while path == get_current():
        walls_list = os.listdir(wallpapers_path)
        wallpaper = choice(walls_list)
        path = os.path.join(wallpapers_path, wallpaper)
    os.system(f"nitrogen --set-scaled --save {path}")


if __name__ == "__main__":
    pick_wallpaper()
