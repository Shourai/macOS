# Install AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# update package list
sudo pacman -Syu --noconfirm

# Install packages
sudo pacman -S i3-wm --noconfirm
sudo pacman -S xorg --noconfirm
sudo pacman -S xorg-xinit --noconfirm
sudo pacman -S dmenu --noconfirm
sudo pacman -S i3blocks --noconfirm
sudo pacman -S archey3 --noconfirm
sudo pacman -S ttf-dejavu --noconfirm
sudo pacman -S openssh --noconfirm
sudo pacman -S python3 --noconfirm
# sudo pacman -S python-pip --noconfirm
sudo pacman -S tmux --noconfirm
# sudo pacman -S vim --noconfirm
sudo pacman -S neovim --noconfirm
sudo pacman -S zsh --noconfirm
sudo pacman -S zsh-syntax-highlighting --noconfirm
sudo pacman -S emacs --noconfirm
sudo pacman -S ledger --noconfirm
sudo pacman -S fasd --noconfirm
sudo pacman -S fzf --noconfirm
sudo pacman -S rxvt-unicode --noconfirm
sudo pacman -S sysstat --noconfirm
sudo pacman -S acpi --noconfirm
sudo pacman -S feh --noconfirm
sudo pacman -S htop --noconfirm
sudo pacman -S pulseaudio --noconfirm
sudo pacman -S alsa-utils --noconfirm
#sudo pacman -S pulseaudioalsa-utils --noconfirm
sudo pacman -S xorg-backlight --noconfirm
sudo pacman -S xf86-video-intel --noconfirm
sudo pacman -S mpv --noconfirm
yay -S ttf-font-awesome --noconfirm
yay -S i3lock-color-git --noconfirm

# Do a cleanup
sudo pacman -Sc --noconfirm
