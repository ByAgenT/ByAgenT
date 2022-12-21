# Update index and upgrade existing packages first
sudo apt update && sudo apt upgrade

# Install curl if does not exist
if ! which curl > /dev/null;
then
  echo "installing curl..."
  sudo apt install curl -y
else
  echo "curl installed, skipping..."
fi

# Install zsh if does not exist
if ! which zsh > /dev/null;
then
  echo "installing zsh..."
  sudo apt install zsh -y
  chsh -s $(which zsh)
else
  echo "zsh already installed, skipping..."
fi

# Install oh-my-zsh if does not exist
if [ ! -d "$HOME/.oh-my-zsh" ]
then
  echo "installing oh my zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh my zsh installed, skipping..."
fi

# Install syntax highlighing
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]
then
  echo "installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
  echo "syntax-highlighting installed, skipping..."
fi

# Install autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]
then
  echo "installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
  echo "zsh-autosuggestions installed, skipping..."
fi
