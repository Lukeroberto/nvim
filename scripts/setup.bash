# Install pyhton/pynvim
sudo apt install python3
pip install -U pynvim

# Install NPM
wget https://nodejs.org/dist/v14.15.4/node-v14.15.4-linux-x64.tar.xz
mkdir -p $HOME/tools
tar xvf node-v14.15.4-linux-x64.tar.xz --directory=$HOME/tools
export PATH="$HOME/tools/node-v14.15.4-linux-x64/bin:$PATH"

# Install ripgrep
sudo apt install ripgrep

# Install Packer
git clone --depth=1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim

# Install patched fonts
sudo apt install fonts-powerline

