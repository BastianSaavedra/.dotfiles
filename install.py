import os
import subprocess
from re import sub

import sh

programs = {
    1: "alacritty",
    2: "kitty",
    3: "fish",
    4: "omf",
    5: "picom",
    6: "neofetch",
    7: "nvim",
    8: "qtile",
    9: "ranger",
    10: "rofi",
}


def menu():
    show_menu = """
        1. alacritty  2. kitty 3. fish
        4. oh-my-fish 5. picom 6. neofetch
        7. neovim     8. qtile 9. ranger
        10. rofi
        0. salir
    """
    return print(show_menu)


def get_tools(option):

    sep = os.path.sep
    actual_dir = os.path.dirname(os.path.abspath(__file__))
    dir = sep.join(actual_dir.split(sep)[:-1])

    for key, value in programs.items():
        if option == key:
            subprocess.run(["rm", "-rf", os.path.join(dir, ".config/", value)])
            subprocess.run(["ln", "-srv", value, os.path.join(dir, ".config/")])


if __name__ == "__main__":
    ciclo = True
    while ciclo == True:
        menu()
        option = int(input("Select tools you want to install: "))
        if 0 < option <= 10:
            get_tools(option)
        elif option == 0:
            ciclo = False
        else:
            print("Option not exist")
