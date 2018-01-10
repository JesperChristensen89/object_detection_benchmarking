install_git_lfs()
{
    set -e
    # Get out if git-lfs is already installed
    if $(git-lfs &> /dev/null); then
        echo "git-lfs is already installed"
        return
    fi

    GIT_LFS_BUILD=$HOME/.bin
    # Install go 1.6 for ARMv6 (works also on ARMv7 & ARMv8)
    sudo apt-get --yes --force-yes install git
    mkdir -p $GIT_LFS_BUILD/go
    pushd "$GIT_LFS_BUILD/go"
        wget https://storage.googleapis.com/golang/go1.6.2.linux-armv6l.tar.gz -O go.tar.gz
        sudo tar -C /usr/local -xzf go.tar.gz
        rm go.tar.gz
        export PATH=$PATH:/usr/local/go/bin
        export GOPATH=$PWD
        echo "PATH=$PATH:/usr/local/go/bin" >> $HOME/.bashrc
        echo "GOPATH=$PWD" >> $HOME/.bashrc

        # Download and compile git-lfs
        mkdir -p src/github.com/github
        pushd src/github.com/github
            git clone https://github.com/github/git-lfs
            pushd git-lfs
              script/bootstrap
              sudo mv bin/git-lfs /usr/bin/
            popd
        popd
    popd
    hash -r
    git lfs install
    set +e
}
install_git_lfs