# Update index and upgrade current packages
sudo apt update && apt upgrade

# Installing neovim
sudo apt install neovim

echo "#Prefer neovim over vim" >> "$HOME/.zshrc"
echo "[ -s \"usr/bin/nvim\" ] && alias vim='nvim'" >> "$HOME/.zshrc"

# Install bat for fzf syntax-highlight
sudo apt install bat
