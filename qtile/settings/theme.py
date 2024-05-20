from os import path
import subprocess, json

qtile_path = path.join(path.expanduser('~'), ".dotfiles", "qtile")

def load_theme():
    theme = ""

    config = path.join(qtile_path, "config.json")
    if path.isfile(config):
        with open(config) as f:
            theme = json.load(f)["theme"]

    else:
        with open(config, "w") as f:
            f.write(f'{{ "theme": "{ theme }"}}\n')


    theme_scheme = path.join(qtile_path, "settings", "themes", f'{theme}.json')
    if not path.isfile(theme_scheme):
        raise Exception(f'"{ theme_scheme }" does not exist')

    with open(path.join(theme_scheme)) as f:
        return json.load(f)

if __name__ == "settings.theme":
    colors = load_theme()
