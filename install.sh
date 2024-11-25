!/bin/bash
echo 'Initializing system'
read -p "First run of install proccess?: (y/n)" firstRun

if [ "$firstRun" == "y" ]; then
    cd "$HOME/dotfiles"
    sudo pacman -Syu
    ### install config files minimun ###
    sudo pacman -S --needed stow
    sudo pacman -S --needed kitty fastfetch tmux
    sudo pacman -S --needed hyprland hyprpaper hyprcursor waybar rofi
    sudo pacman -S --needed neovim
    ### development ### 
    sudo pacman -S --needed clang cmake git lazygit ctags python stlink minicom
    #libraries
    sudo pacman -S --needed ncurses sfml
    ### basic stuff necessary ###
    sudo pacman -S --needed firefox flatpak mpv yazi
    ### utilies ####
    sudo pacman -S --needed zsh bat btop dunst cowsay fzf gnuplot yay zoxide
    ### sistem requeriments ###
    sudo pacman -S --needed base-devel binutils xwaylandvideobridge

    ### setup enviroment ###
    # Install yay from AUR
    git clone https://aur.archlinux.org/yay.git "$HOME/yay"
    cd "$HOME/yay" || exit
    makepkg -si --noconfirm
    cd "$HOME" || exit
    rm -rf "$HOME/yay"
    
    yay -S --noconfirm wlogout hyprshot hyprpicker visual-studio-code-bin pavucontrol

    
    # init python venv
    mkdir -p "$HOME/Programming/"
    python -m venv "$HOME/Programming/venv"
    
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

    # link dotfiles with stow
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
    flatpak install -y flathub org.videolan.VLC
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

