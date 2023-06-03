yes | apt install zsh
yes | RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

custom=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
yes | git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $custom/themes/powerlevel10k
yes | git clone https://github.com/esc/conda-zsh-completion $custom/plugins/conda-zsh-completion
yes | git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $custom/plugins/zsh-syntax-highlighting
yes | git clone https://github.com/zsh-users/zsh-autosuggestions $custom/plugins/zsh-autosuggestions
if ! command -v tldr >/dev/null; then
    echo installing tldr
    if [ "$EUID" -eq 0 ]; then
        bindir="/usr/local/bin"
    else
        bindir="$HOME/bin"
        mkdir $bindir
    fi

    declare -A arch_table=(
        ["arm"]="tealdeer-linux-arm-musleabi"
        ["armhf"]="tealdeer-linux-arm-musleabihf"
        ["armv7"]="tealdeer-linux-armv7-musleabihf"
        ["i686"]="tealdeer-linux-i686-musl"
        ["x86_64"]="tealdeer-linux-x86_64-musl"
    )

    machine_arch=$(uname -m)

    if [[ -n ${arch_table[$machine_arch]} ]]; then
        chosen_file=${arch_table[$machine_arch]}
    else
        echo "Unsupported architecture: $machine_arch"
    fi

    echo "Chosen file: $chosen_file"

    curl -LJ https://github.com/dbrgn/tealdeer/releases/latest/download/$chosen_file > "$bindir/tldr"
    chmod +x "$bindir/tldr"
fi
if [ ! -d "$custom/plugins/tldr" ]; then
    mkdir "$custom/plugins/tldr"
    curl -LJ https://github.com/dbrgn/tealdeer/releases/latest/download/completions_zsh > "$custom/plugins/tldr/_tldr.zsh"
    echo -e 'fpath+="${0:h}"' > "$custom/plugins/tldr/tldr.plugin.zsh"
fi
cp -b --suffix=".pre-autoconfig" .zshrc .p10k.zsh $HOME
zsh
