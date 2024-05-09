# Mis Dotfiles

![Qtile](screenshots/desktop.png)

# Índice
- [Resumen](#resumen)
- [Arch](#arch)
  - [Instalación De ArcoLinux](#instalación-de-arcolinux)
- [Qtile](#qtile)
  - [Config](#config)
  - [Scripts](#scripts)
    - [Autostart](#autostart)
    - [picom](#picom)
  - [Settings](#settings)
    - [Groups](#groups)
    - [Keys](#keys)
    - [Layouts](#layouts)
    - [Mouse](#mouse)
    - [Widgets](#widgets)
- [Neovim](#neovim)
  - [Init.lua](#init)
  - [Lua](#lua)
    - [Configuration](#configuration)
      - [Keymap](#keymap)
      - [Settings](#settings-nvim)
    - [Lua-Plugins](#lua-plugins)
      - [Plugins.lua](#plugins-lua)
    - [Plugins-Config](#plugins-config)
      - [LSP](#lsp)
        - [Init.lua](#lsp-init-lua)
      - [Plugins](#plugins)
    - [Themes](#themes)
- [Alacritty](#alacritty)
- [Shell](#shell)


# Resumen

En este repositorio dejare mi configuración general de Linux, tanto como distro, gestor de
ventanas, editor de texto, etc. Tratare de explicar cada uno de los archivos así tienes un
mejor entendimiento de como funciona, espero que te guste esta confi, ya que he pasado
bastante tiempo configurandolo a mi gusto, sobre todo Neovim, que es mi amado editor de
texto, te dejare ambas configuraciones que tengo, tanto para *".lua"* como para *".vim"*.
Bueno,comencemos!


# Arch

En este caso opte por utilizar ArcoLinux por que ya estaba aburrido de comenzar de 0 cada
vez que tenia un problema. Esta distro esta basada en ArchLinux, por lo cual ocupa los 
mismos comandos, y tambien el mismo gestor de paquetes que es "pacman", en mi configuración
tengo otros paquetes como yay, paru y snap. Estos me sirven para poder agrandar más mi
libreria de paquetes.

## Instalación De ArcoLinux
  
En esta parte no hay mucho que hacer la verdad por que al usar ArcoLinux todo se hace más
facil. La version que yo elegí fue ArcoLinuxB, con el gestor de ventanas Qtile, aquí te
dejo el link (https://sourceforge.net/projects/arcolinux-community-editions/files/qtile/).
Elegí la version "B" porque es basicamente tener un "Arch de cero" por que puedes elegir
todas las aplicaciones, configuraciones, etc. que necesites. Pero este proceso se hace
mas simple por que ocupa un conocido gestor de instalacion llamado "Calamares".
  
En el momento en que booteas el SO te aparecerá una ventana con en donde podrás elegir
si quieres una "Instalación fácil" o "Avanzada", aquí dependerá de tu conocimiento.
Personalmente yo usé la avanzada por que así también evitaba que se me instalarán cosas
que al final no ocuparía. Finalizando esta sección, pasemos al gestor de ventanas.
  
# Qtile

## Config
  
