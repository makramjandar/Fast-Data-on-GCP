#!/bin/bash

#  @uthor and collected with ❤️ by Makram Jandar    _    _
#    / \  / \  / \  / \  / \  / \   / \  / \  / \  / \  / \
#   ( S )( H )( E )( L )( L )( * ) ( R )( E )( A )( D )( Y )
#    \_/  \_/  \_/  \_/  \_/  \_/   \_/  \_/  \_/  \_/  \_/
#          © Install and config zsh, OhMyZsh and GCP Buckets

#    / \  / \  / \
#   ( Z )( S )( H )
#    \_/  \_/  \_/

echo "--- apt install zsh ---"
sudo apt install zsh -y
echo "--- end apt install ---"

#    / \  / \  / \  / \  / \  / \  / \  / \  / \
#   ( O )( H )( - )( M )( Y )( - )( Z )( S )( H )
#    \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/

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
sed -i -e "s/plugins=(.*)/plugins=(keychain gpg-agent git pip vi-mode dirhistory docker extract history command-not-found common-aliases zsh-autosuggestions zsh-syntax-highlighting)/g" .zshrc
echo "--- end install ---"

echo "--- setup keychain plugin for loading multiples identities ---"
sed -i '/^source $ZSH.*/i zstyle :omz:plugins:keychain identities gce' .zshrc
sed -i '/^zstyle :omz:plugins:keychain identities.*/i zstyle :omz:plugins:keychain agents gpg,ssh' .zshrc
echo "--- end setup ---"





#    / \  / \  / \  / \   / \  / \  / \  / \  / \
#   ( P )( U )( R )( E ) ( P )( O )( W )( E )( R )
#    \_/  \_/  \_/  \_/   \_/  \_/  \_/  \_/  \_/

echo "--- install purepower ---"
curl -fsSLO https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower
echo "--- end install ---"

#    / \  / \  / \  / \  / \  / \  / \  / \  / \  / \  / \  / \  / \
#   ( P )( O )( W )( E )( R )( L )( E )( V )( E )( L )( 1 )( 0 )( K )
#    \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/

echo "--- install powerlevel10k ---"
yes Y | git clone https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo "--- end install ---"

#    / \  / \  / \  / \  / \  / \  / \  / \
#   ( S )( O )( U )( R )( C )( I )( N )( G )
#    \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/

echo "--- source powerlevel10k ---"
sed -i -e '$asource ~/powerlevel10k/powerlevel10k.zsh-theme' ~/.zshrc
echo "--- end install ---"

echo "--- source purepower ---"
sed -i -e '$asource ~/.purepower' ~/.zshrc
echo "--- end install ---"

echo "--- source GCP Buckets ---"
sed -i -e '$asource ~/.bash_mount_gcp_buckets' ~/.zshrc
echo "--- end install ---"

echo "--- source .bash_profile ---"
sed -i -e '$asource ~/.bash_profile' ~/.bashrc
echo "--- end install ---"

# FYI
# https://github.com/robbyrussell/oh-my-zsh
# https://github.com/zsh-users/zsh-autosuggestions
# https://github.com/zsh-users/zsh-syntax-highlighting
# https://github.com/romkatv/powerlevel10k
# https://cloud.google.com/storage/docs/gcs-fuse
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/keychain

# 1 line install
# wget -O - -q 'https://raw.githubusercontent.com/makramjandar/Fast-Data-on-GCP/master/utils/install-and-config-shell-ready.sh' | bash
