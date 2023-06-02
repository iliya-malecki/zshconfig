plugins=${ZSH_CUSTOM:-~/.oh-my-zsh/custom/plugins}
apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/esc/conda-zsh-completion $plugins/conda-zsh-completion
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $plugins/zsh-autosuggestions
if [ ! -d "$plugins/tldr" ]; then
    mkdir "$plugins/tldr"
    curl -LJO https://github.com/dbrgn/tealdeer/releases/latest/download/completions_zsh -o "$plugins/tldr/_tldr.zsh"
    echo -e 'fpath+="${0:h}"' > "$plugins/tldr/tldr.plugin.zsh"
fi
cp -b --suffix=".pre-autoconfig" .zshrc .p10k.zsh $HOME
