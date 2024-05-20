from os import path
import json

qtile_path = path.join(path.expanduser('~'), ".dotfiles", "qtile")

theme = "kanagawa_wave"
theme_scheme = path.join(qtile_path,"settings", "themes", f'{theme}.json')
print(theme_scheme)
if not path.isfile(theme_scheme):
    raise Exception(f'"{ theme_scheme }" does not exist')

with open(path.join(theme_scheme)) as f:
    data = json.load(f)

print(data)
