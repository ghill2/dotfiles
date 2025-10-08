
# https://unix.stackexchange.com/a/310714 https://superuser.com/questions/273047/zsh-up-arrow-only-repeats-unique-commands
# ignore duplicates in terminal history
HISTCONTROL=$HISTCONTROL:ignoredups

alias trade='ssh g1@192.168.0.76'
alias tradevs='code -n --folder-uri=vscode-remote://ssh-remote+g1@192.168.0.76/Users/g1/BU/projects/'
alias c=auto_commit
alias wal='wally-cli $(find "$HOME/Downloads" -type f -name "*bin" -exec ls -lt {} + | rev | cut -d " " -f 1 | rev | head -n 1)'
alias de='deactivate'
alias p='cd ~/bu/projects/pytower'
alias d='cd ~/bu/projects/dotfiles'
alias gateway="~/Jts/ibgateway/1037/ibgateway"
alias workstation="~/Jts/tws"
alias work=workstation
alias updatebrew=brew bundle --file=~/.Brewfile
alias dl="~/bu/projects/music/.venv/bin/python ~/bu/projects/music/music/download/cli.py"


remove_from_path() {
    local remove_path="$1"
    local path_var=":$PATH:"
    
    # Check if the directory exists in the PATH
    if [[ ":$PATH:" == *":$remove_path:"* ]]; then
        # Remove all occurrences of the directory from the PATH
        PATH=${path_var//$remove_path:/}
        PATH=${PATH#:}
        PATH=${PATH%:}
        export PATH
        echo "Removed all occurrences of '$remove_path' from PATH."
    else
        echo "'$remove_path' is not in PATH."
    fi
}

# https://superuser.com/a/39995
path_add_front() {
    # This checks whether the directory exists & is a directory before adding it
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1${PATH:+":$PATH"}"
    fi
}

path_add_back() {
    # This checks whether the directory exists & is a directory before adding it
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

system=$(uname -s)
if [ "$system" = "Linux" ]; then
    echo "This is a Linux system"

    . "$HOME/.cargo/env"
        
    export ROCM_PATH=/opt/rocm
    export ROCM_HOME=/opt/rocm

    eval "$(direnv hook bash)" # direnv shell hook

    path_add_front "/home/g1/bu/projects/pymusic"
    path_add_front "/opt/rocm/bin"

    # export LD_LIBRARY_PATH="~/.local/share/uv/python/cpython-3.11.11-linux-x86_64-gnu/bin/lib"

    path_add_front "$HOME/.pyenv/bin"
    export PYENV_ROOT="$HOME/.pyenv"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"


fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "This is a Mac system"

    # eval "$(direnv hook bash)" # direnv shell hook

    eval "$(/opt/homebrew/bin/brew shellenv)" # add brew to path
    
    ulimit -n 4294967295

    export OPENSSL_FIPS=1
    
    path_add_front "/opt/homebrew/opt/trash-cli/bin"

    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"

    path_add_front "/opt/local/bin"  # Macports
    path_add_front "/opt/local/sbin"  # Macports

    
    
    # . "$HOME/.cargo/env" # unrequired if rust installed with homebrew
    # path_add_front "/opt/homebrew/opt/openjdk/bin"
    # path_add_front "/opt/ibc"
    # # Freddie only requires the LD_LIBRARY_PATH to be set, not the PYO3_PYTHON or PYTHONHOME
    # export LD_LIBRARY_PATH="/Users/g1/.local/share/uv/python/cpython-3.11.11-macos-aarch64-none/lib"
    # export PYO3_PYTHON="/Users/g1/BU/projects/pytower/.venv/bin/python"
    # export PYTHONHOME="/Users/g1/.local/share/uv/python/cpython-3.11.11-macos-aarch64-none"
    # export PYO3_USE_VENDOR_PYTHON=1
    # export PYO3_VENDORED_PYTHON_VERSION=3.11.11

fi

if [[ "$system" == "msys" ]]; then
    echo "This is a Wsl system"
    path_add_front "$HOME/BU/projects/nautilus_trader"
    path_add_front "$HOME/BU/projects/pytower"
    # Avoid ssh error using poetry install
    # [WinError 1312] A specified logon session does not exist. It may already have been terminated
    export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
fi

function auto_commit {
    if [ -d .git ] && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        if [ -n "$1" ]; then
            msg="$*"
        else
            msg="auto commit $(date +"%Y-%m-%d %H:%M:%S")"
        fi
        
        git add . \
            && git commit -m "$msg" \
            && git push origin "$(git rev-parse --abbrev-ref HEAD)"
    else
        echo "Current directory is not a top-level git project"
    fi
}

function activate() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        source ./.venv/bin/activate
    elif [[ "$OSTYPE" == "linux"* ]]; then
        source ./.venv/bin/activate
    elif [[ "$OSTYPE" == "msys" ]]; then
    e    source ./.venv/Scripts/activate
    fi
}
alias act='activate'

function mkenv() {
    sudo rm -rf ./.venv && \
    python -m venv ./.venv && \
    . ./.venv/bin/activate && \
    python -m ensurepip --upgrade && \
    pip install --upgrade setuptools
}

re () {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Reloading zshrc..."
        source ~/.zshenv
        source ~/.zshrc
        
    fi
    if [ "$system" = "Linux" ]; then
        echo "Reloading bashrc..."
        source ~/.bashrc
    fi
}
rmenv () {
    sudo rm -rf ./.venv
    sudo rm -rf ./.direnv
    sudo rm -rf ./venv
}
pl () {
    echo $1 | tr : '\n' #separate a string with lines
}
pp () {
    pl $PATH
}
print_line () {
    pl $1
}
ppy () {
    pl $PYTHONPATH
}