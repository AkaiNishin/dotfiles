!/bin/bash
echo 'Initializing system'
read -p "First run of install proccess?: (y/n)" firstRun

if [ "$firstRun" == "y" ]; then
    echo "Installing pacman packages"
    cd "$HOME/dotfiles"
    sudo pacman -Syu
    ### install config files minimun ###
    sudo pacman -S --needed --noconfirm stow kitty fastfetch tmux neovim hyprland hyprpaper hyprcursor waybar rofi eww
    ### development ### 
    sudo pacman -S --needed --noconfirm clang cmake git lazygit ctags python stlink minicom gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential
    #libraries
    sudo pacman -S --needed --noconfirm ncurses sfml
    ### basic stuff necessary ###
    sudo pacman -S --needed --noconfirm firefox flatpak mpv yazi texlive
    ### utilies ####
    sudo pacman -S --needed --noconfirm zsh bat btop dunst cowsay fzf gnuplot zoxide zip, unzip vlc noto-fonts-cjk fcitx5-mozc noto-fonts-emoji rar unrar mpd mpc ncmpcpp
    ### sistem requeriments ###
    sudo pacman -S --needed --noconfirm base-devel binutils ttf-meslo-nerd cargo npm plasma-wayland-protocols ttf-jetbrains ttf-iosevka

    ### setup enviroment ###
    # Install yay from AUR
    echo "Installing yay packages"
    git clone https://aur.archlinux.org/yay.git "$HOME/yay"
    cd "$HOME/yay" || exit
    makepkg -si --noconfirm
    cd "$HOME" || exit
    rm -rf "$HOME/yay"
    
    yay -S --needed --noconfirm wlogout hyprshot hyprpicker visual-studio-code-bin pavucontrol xdg-desktop-portal-hyprland-git ttf-icomoon-feather
    
    # init python venv
    echo "Inicializing python virtual venv enviroment...Installing libraries"
    mkdir -p "$HOME/Programming/"
    python -m venv "$HOME/Programming/venv"
    source ~/Programming/venv/bin/activate
    pip install numpy pandas scipy mypy pyinstaller customtkinter pygame pillow scikit-learn
    deactivate
    
    echo "cloning repositories...utilities"
    # init zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # zsh plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    # tmux plugins
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    mkdir -p "$HOME/.config/tmux/plugins/catppuccin"
    git clone -b v2.1.1 https://github.com/catppuccin/tmux.git "$HOME/.config/tmux/plugins/catppuccin/tmux"
    
    # init sdk for pico
    mkdir -p "$HOME/Programming/pico"
    cd "$HOME/Programming/pico"
    if [ ! -d "pico-sdk" ]; then
        git clone https://github.com/raspberrypi/pico-sdk.git --branch master
    fi
    cd "pico-sdk"
    git submodule update --init
    cd ../
    if [ ! -d "pico-examples" ]; then
    git clone https://github.com/raspberrypi/pico-examples.git --branch master
    fi
    cd "$HOME/dotfiles/"

    # link dotfiles with stow
    echo "linking dotfiles"
    cd "$HOME/dotfiles"
    stow fastfetch
    stow hypr
    stow kitty
    stow nvim
    stow rofi
    stow tmux
    stow waybar
    stow yazi
    stow zshrc  
    
    read -p "To apply changes you need to restart. Do it now? (y/n)" reStartNow
    if [ "$reStartNow" == "y" ]; then
        sudo systemctl reboot
    elif [ "$reStartNow" == "n" ]; then
        echo "Restart skipped. Reboot later to apply changes"
    else
        echo "Invalid key: Restart skipped. Restart later to apply changes"
    fi

elif [ "$firstRun" == "n" ]; then
    echo "Installing applications...this will take long time"
    ## install packages from flatpak
    flatpak install -y flathub com.valvesoftware.Steam
    flatpak install -y flathub dev.vencord.Vesktop
    flatpak install -y flathub org.libreoffice.LibreOffice
    flatpak install -y flathub org.telegram.desktop
    flatpak install -y flathub com.mattjakeman.ExtensionManager
    flatpak install -y flathub org.kde.krita
    flatpak install -y flathub com.obsproject.Studio
    flatpak install -y flathub com.spotify.Client
    flatpak install -y flathub org.octave.Octave
    flatpak install -y flathub it.mijorus.gearlever
else
    echo "Invalid input. Run again and enter 'y' or 'n'."
fi

