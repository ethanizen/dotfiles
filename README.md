# ethanizen's Dotfiles

Config files for  
* hyprland (window manager)
* kitty (terminal emulator)
* zsh (shell) 
* neovim (text-editor)
* tmux (terminal multiplexer)
* waybar (status bar)
* wofi (app launcher)
* satty (screenshot annotation)
* git (you know what that is)
* and some helpful scripts

```bash
~
├── .config
│   ├── hypr
│   ├── kitty
│   ├── nvim
│   ├── pacman
│   ├── satty
│   ├── tmux
│   ├── waybar
│   ├── wofi
│   └── zsh
├── .gitconfig
├── .local
│   ├── bin
│   └── share
│       └── Steam    # CS2 autoexec.cfg / practice.cfg
└── .zshrc
```

Files are organized using GNU `stow`. The prompt and tmux plugins are git
submodules, so clone recursively — `stow .` on its own will leave you with
empty directories and a broken prompt.

```bash
git clone --recurse-submodules git@github.com:ethanizen/dotfiles ~/.dotfiles
cd ~/.dotfiles
stow .
```

Already cloned without `--recurse-submodules`? 

```bash
git submodule update --init --recursive
```

To restore the package set on a fresh Arch install:
```bash
sudo pacman -S --needed - < .config/pacman/pkglist.txt
```

Regenerate that list after installing or removing anything:
```bash
pacman -Qqe > .config/pacman/pkglist.txt
```

## Branches

`main` holds everything machine-agnostic. `desktop` is `main` plus a single
commit carrying `.config/hypr/monitors.conf` for the dual-monitor setup. Do
non-monitor work on `main` and rebase `desktop` onto it, so the two hosts
don't drift.

See? Easy.
