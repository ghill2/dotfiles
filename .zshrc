source "$HOME/.bashrc"

# https://superuser.com/questions/273047/zsh-up-arrow-only-repeats-unique-commands
# https://unix.stackexchange.com/a/310714
setopt histignoredups


# MAC only aliases.

# path_add_front "$gparent/util"
# path_add_front "/usr/local/mysql/bin"

# enable logging in leaks tool https://www.mono-project.com/docs/advanced/runtime/memory-leaks/
# export MallocStackLogging=1 .../build/bin/mono-sgen program.exe

# source ~/.direnvrc
# parent() {
#     echo `dirname $(realpath .)`
# }

# gparent() {
#     echo `dirname $(dirname $(realpath .))`
# }

# ggparent() {
#     echo `dirname $(dirname $(dirname $(realpath .)))`
# }
# source "$SCRIPT_DIR/.direnvrc"
# function parent {
#     echo `dirname $(realpath .)`
# }
# function gparent {
#     echo `dirname $(dirname $(realpath .))`
# }
# function ggparent {
#     echo `dirname $(dirname $(dirname $(realpath .)))`
# }
# function ggparent {
#     echo `dirname $(gparent)`
# }

# make parent, gparent, ggparent commands available in shell
# source "$HOME/.bashrc"

# Allows VIM navigation in the terminal https://dougblack.io/words/zsh-vi-mode.html
# bindkey -v

# In order to use zplug, please add the following to your .zshrc: https://formulae.brew.sh/formula/zplug
# export ZPLUG_HOME=$(brew --prefix)/opt/zplug
# source $ZPLUG_HOME/init.zsh
# #zplug "jeffreytse/zsh-vi-mode", frozen:1
# #zplug "ohmyzsh/ohmyzsh", frozen:1
# #zplug "plugins/macos",   from:oh-my-zsh
# #zplug "plugins/git",   from:oh-my-zsh~
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi
# zplug load --verbose

# oh-my-zsh plugins
# plugins=(macos)

# export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

# add pwd prefix to prompt
# show_virtual_env() {
#   if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
#     echo "($(basename $VIRTUAL_ENV))"
#   fi
#parent="$(cd "$(dirname "$0")"; pwd)"
#cd $parent
#echo $parent

# source ~/.bashrc


# to set hostname
# source "$HOME/BU/projects/bootstrap/bootstrap"

# overwrite system python with python installed with brew
# https://stackoverflow.com/a/48101303
# python3.11 installed with Brew only has pip3, works with virtualenv
# alias -g pip=pip3

# https://stackoverflow.com/a/51373253
# alias -g pip='python3.10 -m pip'

# python3.11 installed with Brew only has python3, works with virtualenv
# alias -g python=python3.10

# alias pytest="python -binytest"