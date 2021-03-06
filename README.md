# Configuration for macOS with dotfiles

## Overview
This repository installs everything I need from a clean install of macOS Sierra or Arch Linux.
By running `install`, `homebrew` will be installed (on macOS) which subsequently installs `git`.
The repositories `macOS` and `dotfiles` will be cloned to my Documents folder.

### macOS directory
in `brew.sh` are all brew packages I use.
in `dotfiles.sh`, the dotfiles are symlinked to the home directory, this includes the dotfiles for Linux distros.
in `shell.sh`, BASH gets replaced for ZSH, also for Linux distros.
in `miscellaneous.sh` some packages are installed e.g. `matplotlib` for python3.
Finally in `macOS.sh`, configurations to macOS are performed e.g.: keyboard repeat speed.

###  Arch directory
in `packages.sh`, are all the packages I use.

## Features
- macOS
- Arch
- iTerm2
- zsh with syntax highlighting
- (neo)vim
- emacs

## Installation
Here I have my configuration for a clean setup.
The only thing that would be handy is to create your user and add it to the `wheel` group.
```
useradd -m -G wheel [username]
```
Be sure to allow the wheel group to run sudo commands via `visudo`

Basically run the `install` after cloning this repository.
Or run the following cURL command:
```
curl -fsSL https://raw.githubusercontent.com/Shourai/dotfiles/master/install | bash
```

## Future reference

### Setting up custom `defaults write` on macOS
1. `defaults read > a`
2. Open system preferences and change the setting to some other value than the default.
3. `defaults read > b`
4. `diff a b`

## Improvements

## Directory Listing

    .
    ├── android
    │   ├── install
    │   ├── packages.sh
    │   ├── README.md
    │   └── termux.properties
    ├── arch
    │   ├── bspwm
    │   ├── fontconfig
    │   ├── fonts
    │   ├── i3
    │   ├── packages.sh
    │   ├── picom.conf
    │   ├── polybar
    │   ├── README.md
    │   ├── sxhkd
    │   ├── urxvt
    │   ├── xinitrc
    │   └── xresources
    ├── emacs.d
    │   ├── auto-save-list
    │   ├── custom.el
    │   ├── elpa
    │   ├── emacs.el
    │   ├── emacs.org
    │   ├── init.el
    │   ├── projectile-bookmarks.eld
    │   ├── recentf
    │   ├── snippets
    │   ├── transient
    │   └── unused.org
    ├── install
    ├── latexmkrc
    ├── ledgerrc
    ├── macOS
    │   ├── brew.sh
    │   ├── com.googlecode.iterm2.plist
    │   ├── dotfiles.sh
    │   ├── macOS.sh
    │   ├── miscellaneous.sh
    │   └── shell.sh
    ├── mbsyncrc
    ├── msmtprc
    ├── neomutt
    │   ├── account.1
    │   ├── dracula.muttrc
    │   └── neomuttrc
    ├── nvim
    │   ├── autoload
    │   ├── init.vim
    │   ├── local_bundles.vim
    │   ├── local_init.vim
    │   ├── plugged
    │   └── session
    ├── README.md
    ├── tmux.conf
    ├── weechat.conf
    └── zsh
        ├── async.zsh
        ├── LS_COLORS
        ├── pure.zsh
        └── zshrc

