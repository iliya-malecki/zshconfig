yes | apt install zsh
yes | RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

custom=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
yes | git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $custom/themes/powerlevel10k
yes | git clone https://github.com/esc/conda-zsh-completion $custom/plugins/conda-zsh-completion
yes | git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $custom/plugins/zsh-syntax-highlighting
yes | git clone https://github.com/zsh-users/zsh-autosuggestions $custom/plugins/zsh-autosuggestions
if [ ! -d "$custom/plugins/tldr" ]; then
    mkdir "$custom/plugins/tldr"
    curl -LJO https://github.com/dbrgn/tealdeer/releases/latest/download/completions_zsh -o "$custom/plugins/tldr/_tldr.zsh"
    echo -e 'fpath+="${0:h}"' > "$custom/plugins/tldr/tldr.plugin.zsh"
fi
cp -b --suffix=".pre-autoconfig" .zshrc .p10k.zsh $HOME
zsh
