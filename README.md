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

Regenerate that list by hand after installing or removing anything:
```bash
pacman -Qqe > .config/pacman/pkglist.txt
```

Or leave it to the weekly timer — see below.

## Package list sync

`.local/bin/dotfiles-pkglist-sync` regenerates the package list and publishes
it, driven by a weekly user timer. It commits to `main` even when `desktop` is
checked out, by taking main's tree and swapping the one blob, so it cannot
commit anything but the package list. Pushes are append-only: no `--force`, no
history rewriting. Anything unexpected — a diverged `main`, staged changes, a
detached HEAD — stops the run instead of being resolved automatically. If the
worktree has other uncommitted changes, `main` is still published and `desktop`
is left for you to merge.

It reads its credential setup from `~/.config/dotfiles-sync.env`, which is
machine-local and deliberately not tracked here. Set that up, then:

```bash
systemctl --user enable --now dotfiles-pkglist-sync.timer
```

Check on it:
```bash
dotfiles-pkglist-sync --dry-run                        # what would go out
systemctl --user start dotfiles-pkglist-sync.service   # run it now
journalctl --user -u dotfiles-pkglist-sync.service     # what it did
systemctl --user list-timers dotfiles-pkglist-sync.timer
```

## Branches

`main` holds everything machine-agnostic. `desktop` is `main` plus a single
commit carrying `.config/hypr/monitors.conf` for the dual-monitor setup. Do
non-monitor work on `main` and rebase `desktop` onto it, so the two hosts
don't drift.

See? Easy.
