#zsh, tmux, oh-my-zsh, powerlevel10k, purepower

echo "--- start update ---"
sudo apt-get update
echo "--- end update ---"

echo "--- apt install zsh tmux---"
sudo yes Y | apt-get install zsh tmux
echo "--- end apt install ---"

echo "--- install oh-my-zsh ---"
yes Y | sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo "--- end install ---"

echo "--- install zsh-autosuggestions ---"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "--- end install ---"

echo "--- install zsh-syntax-highlighting ---"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "--- end install ---"

echo "--- install zsh-plugins ---"
sed -i -e "s/plugins=(.*)/plugins=(git pip vi-mode dirhistory docker extract history command-not-found common-aliases zsh-autosuggestions zsh-syntax-highlighting)/g" .zshrc
echo "--- end install ---"

echo "--- install powerlevel10k ---"
yes Y | git clone https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k && echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
echo "--- end install ---"

echo "--- install purepower ---"
cd && curl -fsSLO https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower && echo 'source ~/.purepower' >>! ~/.zshrc
echo "--- end install ---"

echo "--- set zsh default ---"
chsh -s $(which zsh)
echo "--- done ---"

echo "--- exec bash ---"
exec bash
echo "--- done ---"

echo "--- exec zsh ---"
exec zsh
echo "--- done ---"
