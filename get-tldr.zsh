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
