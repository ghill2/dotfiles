GPARENT="$(dirname "$(dirname "$(realpath "$(readlink -f "${BASH_SOURCE:-$0}" 2>/dev/null || echo "${BASH_SOURCE:-$0}")")")")"
PARENT="$(dirname "$(realpath "$(readlink -f "${BASH_SOURCE:-$0}" 2>/dev/null || echo "${BASH_SOURCE:-$0}")")")"

# https://unix.stackexchange.com/a/310714 https://superuser.com/questions/273047/zsh-up-arrow-only-repeats-unique-commands
# ignore duplicates in terminal history
HISTCONTROL=$HISTCONTROL:ignoredups

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

    # add pyenv to path
    export PYENV_ROOT="$HOME/.pyenv"
    path_add_front "$PYENV_ROOT/bin"
    eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
    
    # intel-mkl libraries for RVC singing voice conversion
    # export PATH="$PATH:/opt/intel/bin"
    # export LD_LIBRARY_PATH="$PATH:opt/intel/mkl/lib/intel64_lin/"
    # remove_from_path "/opt/intel/bin"
    export ROCM_PATH=/opt/rocm

    # Direnv shell hook
    eval "$(direnv hook bash)"

fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "This is a Mac system"

    alias -g sk='pkill skhd && skhd &!'  # kill then relaunch skhd in daemon mode
    # alias -g sk='pkill skhd && skhd --reload'  # kill then relaunch skhd in daemon mode

    


    # Add chrome alias
    # https://github.com/asyne/cproto#running-chrome-in-debug-mode
    alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

    path_add_front "/opt/ibc"
    path_add_front "/opt/homebrew/opt/openjdk/bin"
    # export PATH="/opt/homebrew/Cellar/faiss/1.7.4/include:$PATH"
    # export LD_LIBRARY_PATH=/opt/homebrew/Cellar/faiss/1.7.4/include:$LD_LIBRARY_PATH

    # sudo ln /opt/homebrew/Cellar/faiss/1.7.4/include/faiss /usr/local/include

    # # Check if the directory is not already in the LD_LIBRARY_PATH
    # LIBRARY_DIR="/opt/homebrew/Cellar/faiss/1.7.4/include"
    # if [[ ":$LD_LIBRARY_PATH:" != *":$LIBRARY_DIR:"* ]]; then
    #     export LD_LIBRARY_PATH=$LIBRARY_DIR:$LD_LIBRARY_PATH
    # fi
    
    # Switches the terminal to use pyenv versions. Linux and Mac
    eval "$(pyenv init -)"
    
    # Direnv shell hook
    eval "$(direnv hook zsh)"

    # add brew to path
    eval "$(/opt/homebrew/bin/brew shellenv)"

    . "$HOME/.cargo/env"

    ulimit -n 10240
    RUST_BACKTRACE=full

    export OPENSSL_FIPS=1

    path_add_front "$PARENT/bin" # DOES THIS ACTUALLY WORK? just adds ~/bin

fi

if [[ "$system" == "msys" ]]; then
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


if [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
    export PATH=/opt/homebrew/bin:$PATH
fi

alias g1='ssh g1@g1.local'
alias g2='ssh g1@g2.local'
alias g2c='code -n --folder-uri=vscode-remote://ssh-remote+g1@g2.local/Users/g1/BU/projects/'
alias g3='ssh g1@g3.local'
alias g3c='code -n --folder-uri=vscode-remote://ssh-remote+g1@g3.local/Users/g1//BU/projects/'
alias t2='ssh -t g1@t2 powershell'
alias t2c='code -n --folder-uri=vscode-remote://ssh-remote+g1@t2.local/Users/g1/BU/projects/'
alias server='ssh g1@server.local'
alias serverc='code -n --folder-uri=vscode-remote://ssh-remote+g1@server.local/Users/g1/BU/projects/'
alias aic='code -n --folder-uri=vscode-remote://ssh-remote+g1@100.78.148.55/home/g1/bu/projects'
alias d='cd ~/BU/projects/dotfiles'
alias p='cd ~/BU/projects'
alias c=auto_commit
alias ac='git add . && git commit --amend --no-edit'  # he --no-edit flag ensures that the commit message remains unchanged.
alias up='update'  # he --no-edit flag ensures that the commit message remains unchanged.
alias wal='wally-cli $(find "$HOME/Downloads" -type f -name "*bin" -exec ls -lt {} + | rev | cut -d " " -f 1 | rev | head -n 1)'
alias de='deactivate'


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
    # deactivate > /dev/null 2>&1; pyenv virtualenv $PYENV_VERSION .venv
    # virtualenv --python=$(pyenv which python) --always-copy ./.venv
    rm -rf ./.venv && \
	python -m venv ./.venv && \
	. ./.venv/bin/activate
}

re () {
    echo "Reloading bashrc..."
    source ~/.bashrc
        
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Reloading zshrc..."
        source ~/.zshenv
        source ~/.zshrc
        
    fi
}
rmenv () {
    rm -rf ./.venv
    rm -rf ./.direnv
    rm -rf ./venv
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


# path_add_front "/Users/g1/Downloads/openssl-3.0.8"







# /opt/homebrew/opt/openjdk/bin:/Users/g1/.pyenv/shims:/Users/g1/.cargo/bin:/Users/g1/BU/projects/dotfiles/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/dotnet:~/.dotnet/tools
# export PATH=/opt/homebrew/bin:/opt/ibc
# For the system Java wrappers to find this JDK, symlink it with
  # sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

# openjdk is keg-only, which means it was not symlinked into /opt/homebrew,
# because macOS provides similar software and installing this software in
# parallel can cause all kinds of trouble.

# If you need to have openjdk first in your PATH, run:
  # echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"' >> ~/.zshrc

# For compilers to find openjdk you may need to set:
  # export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"



# . ~/.bashrc
# update_prompt() {
#     echo "Executing custom_precmd function"
# }
# PROMPT_COMMAND=custom_precmd

# NOT WORKING in git-bash, doesn't update when cd'ing
# Define color code variables
# BLACK="\[\033[0;30m\]"
# RED="\[\033[0;31m\]"
# GREEN="\[\033[0;32m\]"
# YELLOW="\[\033[0;33m\]"
# BLUE="\[\033[0;34m\]"
# MAGENTA="\[\033[0;35m\]"
# CYAN="\[\033[0;36m\]"
# WHITE="\[\033[0;37m\]"
# RESET="\[\033[0m\]"
# PS1="${YELLOW}$PWD${RESET} $(echo `which python` | awk -F/ '{print $(NF-2), $(NF-1), $NF}' OFS="/") "
# Define the function to update the Git prompt
# update_prompt() {
#     PS1='\u@\h:\w$(__git_ps1 " (%s)")\$ '
#     source ~/.bashrc
#     # PS1="$PWD "
# }
# Set the PROMPT_COMMAND to call the update_git_prompt function
# PROMPT_COMMAND='update_prompt'
# precmd_functions+=(update_prompt)
# Initialize the Git prompt initially
# update_git_prompt
# export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(__git_ps1)\[\033[00m\]\$ '


# echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

# # Prepend activated python interpreter path on prompt
# function update_prompt {
#     # : '
#     # %m = hostname
#     # %3d%% = trim cd by x
#     # '

#     echo "prompt reset"
#     # Display the activated virtual environment in the prompt
#     # if [[ -n "$VIRTUAL_ENV" ]]; then
#     #     PS1="($VIRTUAL_ENV) %n@%m: %2d%% "
#     # else
#     #     PS1="`which python` %n@%m: %2d%% "
#     # fi
#     # PS1="`which python` %n@%m: %2d%% "
    
#     # COLOR_RESET='%f'
#     # if [[ "$HOSTNAME" == "g1" ]]; then
#     #     COLOR='%F{yellow}'
#     # fi
#     # if [[ "$HOSTNAME" == "g2" ]]; then
#     #     COLOR='%F{yellow}'
#     # fi
#     # if [[ "$HOSTNAME" == "g3" ]]; then
#     #     COLOR='%F{red}'
#     # fi
#     # PS1="`which python` ${COLOR}%m${COLOR_RESET}: %3d%% "

#     # # Check if the string starts with the substring
#     # if [[ $string == $substring* ]]; then
#     # # Trim the substring from the beginning of the string
#     #     trimmed_string="${string#$substring}"
#     #     echo "Original string: $string"
#     #     echo "Trimmed string: $trimmed_string"
#     # else
#     #     echo "Substring doesn't match the start of the string."
#     # fi
#     # : '
#     # %m = hostname
#     # %3d%% = trim cd by x
#     # '
#     # GIT_BASH_DEFAULT_PS1="\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$"


    

# }
# precmd_functions+=(update_prompt)  # Execute the update_prompt function on cd

# # https://discussions.binle.com/thread/251000125
# # rustc compiler failed when building nautilus because "too many files open"
# function reset_python() {
#     # resets the global pyenv
#     if [ "$(which python)" = "/Users/g1/.pyenv/shims/python" ]; then
#         echo "Output matches the string."
#         pip cache purge
#         pyenv uninstall -f $PYENV_VERSION
#         pyenv install $PYENV_VERSION
#     else
#         echo "Output does not match the string."
#     fi
# }
# added



# https://stackoverflow.com/a/19770395
    # CAUSES ERROR DO NOT USE!
    # export LC_CTYPE=C
    # export LANG=C