######### SHARED - PYMUSIC DEPS ##########
# This file should contain software
# that should be installed on the servers
# and should be installed on every comp

# Requirements
tap "esolitos/ipa"
tap "yulrizka/tap"
tap "candid82/brew"  # for joker dependency

tap "jesseduffield/lazygit"
brew "mas"  # install apps through app store

# CLI Apps
cask "kitty"
brew 'node'
brew 'yarn' 23
brew "npm" # necessary for nvim config to install LSPs
brew 'nmap'  # Port scanning utility for large networks
brew 'choose-gui'  # choose commands
brew 'maturin'  # Build and publish crates with pyo3, rust-cpython, cffi and uniffi bindings as well as rust binaries as python packages.
brew 'virtualenv'  # make virtualenv with pyenv
brew 'wget'
brew 'coreutils' # realpath
brew 'rsync'
brew 'fswatch' # run bash script when directory changes
brew 'ta-lib'
brew 'make'
brew 'ta-lib'
brew 'fd'  # linktrigger script

# JUST INSTALL RUST FROM THEIR WEBSITE, ALOT BETTER!!!! use default profile, not minimal or complete
# CAUTION! do not install rust, rustup comes with rustc compiler and you can change to nightly.
# rust locks to stable and disallows self updating, useful only if you need the stable channel
# brew 'rust'
# brew 'rustup'
# brew 'rustup-init'
brew 'pre-commit'
brew 'lua'
brew 'duti' # set default app for file in terminal
brew 'direnv'
brew 'poetry'
brew 'pyenv'
brew 'iperf'  # test lan speed
brew 'iperf3'  # test lan speed
brew 'yarn'  # npm scaffolder
brew 'defaultbrowser'  # set the default browser from the terminal, used in settings
brew "openjdk"  # opensource java sdk, identical to oracle java sdk
brew 'koekeishiya/formulae/skhd', restart_service: true
brew 'p7zip'  # extract dmg files on mac
brew "redis", restart_service: true
brew "fzf"
brew "ripgrep"
brew "rsync"
brew "bat"
brew "jq"
brew "git"
brew "postgresql@14"
brew "neovim"
brew "zoxide"
brew "starship"
brew "zsh-completions"
brew "xplr"
brew "broot"
brew "antigen"
brew "tmux"
brew "trash"
brew "showkey"
brew "rar"
brew "uv"
brew "cargo-instruments"  # rust profiler using mac cargo instruments

brew "lazygit"
brew "diff-so-fancy"
brew "git-delta" # lazygit diff


brew 'tailscale'
cask 'tailscale'  # Additional Step Afterwards: Security & Private > Allow

brew 'pamburus/tap/hl' # pytower json log viewer




# Applications
#
cask "tad"
cask "alacritty"
cask "datagrip" # GUI postgres / db viewer
cask 'visual-studio-code'
cask 'google-chrome'
cask 'the-unarchiver'
cask 'symboliclinker'

# July 2024:
# freddie: All of this bloatware I do not need
#######################################################################
# VSCode extensions

vscode "ms-python.python"
vscode "ms-python.vscode-pylance" # used by python extension to provide LSP
vscode "ms-python.isort"  # used by python extension to sort imports (does not remove unused imports)
vscode "ms-python.black-formatter" # used by python extension for formatting
vscode "ms-python.autopep8" # used by python extension for formatting
vscode "ms-python.flake8" # used by python extension for linting
vscode "evgeniypeshkov.syntax-highlighter"  # tree-sitter syntax highlighting in vscode
vscode "mikoz.autoflake-extension" # ERROR: doesn't find autoflake install. sort imports and remove unused imports
vscode "ms-python.pylint" # used by python extension for linting
vscode "ms-python.mypy-type-checker" # used by python extension for linting
vscode "usernamehw.commands"  # show and run commands in a dropdown menu
vscode "yzane.markdown-pdf"  # export markdown as pdf
vscode "rust-lang.rust-analyzer"
vscode "bungcip.better-toml"
vscode "sharat.vscode-brewfile"
vscode "Cameron.rerun-last-command"
vscode "shardulm94.trailing-spaces"  # show trailing spaces in the editor
vscode "ariaminaei.vscode-jump-to-counterpart"
vscode "guyskk.language-cython"
vscode "dakara.dakara-foldplus" # extended fold commands
vscode "ms-vscode.live-server" # live preview browser
vscode "tomoki1207.pdf" # preview pdf files
vscode "eamodio.gitlens"
vscode "KevinRose.vsc-python-indent"  # python auto indenter
vscode "ms-vscode-remote.remote-ssh"
vscode "ms-vscode-remote.remote-ssh-edit"
vscode "ms-vscode.remote-explorer"
vscode "ms-vscode.remote-server"
vscode "baincd.copy-path-unixstyle" # copy unix path when ssh'ed to windows using git-bash
vscode "VisualStudioExptTeam.vscodeintellicode"  # ai powered suggestions for python, typescript, javascript
vscode "charliermarsh.ruff"
vscode 'ms-vscode.remote-repositories'
vscode "canadaduane.vscode-kmonad"  # kmonad (lisp) syntax highlighting
vscode "entibo.vscode-kmonad-format"  # format kmonad (lisp) files
vscode "pokey.command-server"  # run comands using file based RPC
vscode "ryuta46.multi-command"  # run a sequence of commands from keybindings.json
vscode "Minkey27.pytest-grabber"  # copy pytest path of method to clipboard for pasting to terminal
vscode "pamaron.pytest-runner" # run pytest method and class with action

# vscode "TrungNgo.autoflake" # remove unused imports
# vscode "GitHub.copilot"

brew 'esolitos/ipa/sshpass' # ssh without password prompt
brew 'hudochenkov/sshpass/sshpass' # ssh without password prompt

# goku
tap "yqrashawn/goku"
brew 'goku', restart_service: true
brew 'watchexec'  # goku dependency

brew 'weasyprint'  # for creating invoices. html > pdf
brew 'libusb' # moonlander keyboard

# george_desktop.Brewfile
cask 'tor-browser'
cask 'geekbench'
cask "transmission"
cask 'firefox'
cask 'slack'
cask 'evernote'
brew 'joker'  # goku dependency
cask 'zsa-wally'


brew 'duckdb'
tap 'timescale/tap'
brew 'timescaledb'  # installs postgresql@17 too
# cask "redisinsight"  # GUI for redis