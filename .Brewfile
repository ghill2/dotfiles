# NOTE: run rustup-init  afterwards
# TODO split brewfiles on second comp
# 2nd comp: cask docker (GUI app, install before brew docker), brew act, brew docker (CLI tools)
# main ~/.config/MyBrewfile
# https://homebrew-file.readthedocs.io/en/latest/usage.html#use-machine-specific-brewfile
# main ~/.config/MyBrewfile

# No, removing a package from a .Brewfile will not automatically uninstall the package from your system. The .Brewfile is used as a manifest file by Homebrew to track the packages installed on your system and manage their installation and updates.
# If you remove a package from the .Brewfile, it simply means that Homebrew will no longer manage that package. However, the package will still remain installed on your system unless you explicitly uninstall it.

# needed for code-cli
# code version use stable --install-dir "/Applications/Visual Studio Code.app"


# for app store apps use mas search "Blackmagic Disk Speed Test" to search for the id
tap "homebrew/cask"
tap "esolitos/ipa"
tap "yulrizka/tap"

tap "homebrew/services"  # needed for skhd
tap "koekeishiya/formulae"
brew 'koekeishiya/formulae/skhd', restart_service: true
brew 'nmap'  # Port scanning utility for large networks
brew 'choose-gui'  # choose commands
brew 'maturin'  # Build and publish crates with pyo3, rust-cpython, cffi and uniffi bindings as well as rust binaries as python packages.
brew 'mas' # brew bundle requirement. install mac app store apps.

# brew 'setvolume'  # using karabiner to change function keys to native keys
# brew 'setvolume'  # using karabiner to change function keys to native keys
# cask 'sound-control'  # using karabiner to change function keys to native keys

# mas 'XCode', id: 497799835  # not working with georgehill010@icloud.com
# mas 'Blackmagic Disk Speed Test', id: 425264550
brew 'virtualenv'  # make virtualenv with pyenv
brew 'wget'
brew 'libsndfile'  # needed for spleeter
brew 'ffmpeg'  # needed for spleeter
brew 'coreutils' # realpath
brew 'yarn'  # npm scaffolder
brew 'rsync'
brew 'fswatch' # run bash script when directory changes
brew 'ta-lib'
brew 'make'
brew 'npm'
brew 'ta-lib'
brew 'fd'  # linktrigger script
brew 'rustup-init' # RUN rustup-init afterwards! for rustup analyzer vscode extension
brew 'pre-commit'
brew 'lua'
brew 'duti' # set default app for file in terminal
brew 'direnv'
brew 'libusb' # moonlander keyboard
brew 'poetry'
brew 'pyenv'
brew 'weasyprint'  # for creating invoices. html > pdf
brew 'iperf'  # test lan speed
brew 'iperf3'  # test lan speed
brew 'esolitos/ipa/sshpass' # ssh without password prompt
brew 'hudochenkov/sshpass/sshpass' # ssh without password prompt
# brew 'cliclick' # keystrokes in terminal
brew 'p7zip'  # extract dmg files on mac
brew 'bitwarden-cli'
brew 'defaultbrowser'  # set the default browser from the terminal, used in settings
brew 'wally'

# macOS Valgrind
# brew tap LouisBrunner/valgrind
# brew install --HEAD LouisBrunner/valgrind/valgrind
#######################################################################
# Cask
cask 'zsa-wally'
cask 'anydesk'
cask 'bitwarden'
cask 'visual-studio-code'
cask 'microsoft-excel'
cask 'microsoft-powerpoint'
cask 'syncthing'
cask 'karabiner-elements'
cask 'find-any-file'
cask 'tailscale'  # Additional Step Afterwards: Security & Private > Allow
cask 'geekbench'
cask 'pycharm'
cask 'keka'
cask 'the-unarchiver'
cask 'firefox'
cask 'fman'
cask 'symboliclinker' # Service that allows users to make symbolic links in the Finder
cask 'google-chrome'
cask 'vlc'
cask 'Discord'
cask 'evernote'
cask 'tor-browser'
cask 'whatsapp'
cask 'slack'
cask 'pacifist'
cask 'microsoft-remote-desktop'
cask 'mixed-in-key'
#######################################################################

# per machine .Brewfile
# https://github.com/Homebrew/homebrew-bundle/issues/521#issuecomment-509023309
# script_directory = File.dirname($0)
# parent_directory = File.expand_path("..", script_directory)
# gparent_directory = File.expand_path("..", parent_directory)
filepath = "/Users/g1/BU/projects/dotfiles/.Brewfile.#{Socket.gethostname}"
puts filepath
if File.exist?(filepath)
    instance_eval(File.read(filepath))
end

#######################################################################
# VSCode

vscode "ms-python.python"
vscode "ms-python.vscode-pylance" # used by python extension to provide LSP
vscode "ms-python.isort"  # used by python extension to sort imports (does not remove unused imports)
vscode "ms-python.black-formatter" # used by python extension for formatting
vscode "ms-python.autopep8" # used by python extension for formatting
vscode "ms-python.flake8" # used by python extension for linting

vscode "evgeniypeshkov.syntax-highlighter"  # tree-sitter syntax highlighting in vscode
# vscode "TrungNgo.autoflake" # remove unused imports
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
vscode "GitHub.copilot"

# cask "backblaze" # also run the installer at /usr/local/Caskroom/backblaze/8.5.0.640/Backblaze Installer.app:
# vscode "kira-dev.copy-unix-path" # add copy unix path (WSL) to menu
# vscode "ritwickdey.LiveServer" # live reload
# "usernamehw.errorlens"
# "ms-vscode.cpptools"
# "formulahendry.code-runner"
# "TomRijndorp.find-it-faster"
# "bradlc.vscode-tailwindcss" # tailwind intellisense
# "pamaron.pytest-runner" # run pytest test


# "maruruh.vscode-quick-menu-builder" # build your own command palette menu
# "ryuta46.multi-command" # run multiple command in a single command
# "esbenp.prettier-vscode" # html, javascript, json, css, html formatter
# "matangover.mypy" # using ms-python.mypy for now
# "sswg.swift-lang" # not using swift for now
################
# QMK
# "ciantic.keymapceditor-vsc"
# "editorconfig.editorconfig" # becomes unresponsive, disabled
###########
# "ms-vscode.cmake-tools",
# "asvetliakov.vscode-neovim"
# "vadimcn.vscode-lldb", # custom debugger to launch app in JUCE
# "bierner.docs-view",
# "sketchbuch.vsc-workspace-sidebar",
# "ibrahimfadel.yabai-syntax-highlighting"
# "promise96319.snippets-manager"
# "tahabasri.snippets" # manage snippets in a separate pane
# "vscode-snippet.Snippet" # get snippets from cht.sh, alternative to searching on stackoverflow.
# "yzhang.markdown-all-in-one" # export markdown
# "twxs.cmake",
# "XadillaX.viml", # vim syntax highlighting
# "vspacecode.whichkey",
# "lfurzewaddock.vscode-wsl-workspacefolder" # for converting workspace folder in settings

# "pkief.material-icon-theme"
# "AndreyVolosovich.monokai-st3"
# "zhuangtongfa.material-theme"
# "monokai.theme-monokai-pro-vscode"
# "bungcip.better-toml"
# "aaronduino.nix-lsp" #requires rnix-lsp package
# "bbenoist.nix"
# "arrterian.nix-env-selector"

# Notes
# "ryanmcalister.unotes"
# "Kasik96.swift", # alternative unoffical swift language support:
# snowords.open-any-url

# Remove all extensions first
# code --list-extensions | xargs -L 1 code --uninstall-extension
# rm -rf ~/.vscode/extensions

# Add linktrigger extension
# dest="/Users/$(whoami)/.vscode/extensions" # if run as sudo whoami becomes root
# echo $dest
# mkdir -p "$dest"
# sudo ln -sf "/Users/g1/BU/projects/openline" "$dest"

# code --install-extension (<extension-id> | <extension-vsix-path>)
# https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management
# parent="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Fix permission error during install of Whichkey extension https://stackoverflow.com/questions/64456367/vscode-wont-install-extension-permission-denied
# sudo chown -R $(whoami) ~/Library/Application\ Support/Code/CachedExtensionVSIXs

# Needed to fix permission error in vim (not neovim) VSCode extension
# sudo chown -R $(whoami) ~/Library/Application\ Support/Code/User/globalStorage

#######################################################################

# cask 'zazu'
# cask 'fiscript'
# cask 'launchbar'
# cask 'alfred'


# cask 'hyperkey' # USING karabiner now for vscode support, use hyperkey in vscode shift+ctrl+alt+command
# cask 'keyboard-maestro'
# brew 'python@3.10' # /usr/local/bin/python3, USING pyenv to manage system python versions
# load "~/BU/dotfiles/.Brewfile_#{Socket.gethostname}"
# Install machine specific packages in separate Brewfile
# main '/Users/g1/BU/dotfiles/.Brewfile.g2'

# cask 'obs'
# cask 'teamviewer'

# cask 'github'
# cask 'resilio-sync'
# cask 'webstorm'
# cask 'houdahspot'  # find files
# cask 'rekordbox'

# cask 'cerebro' # application switcher with plugin API in javascript
# cask 'fork'
# cask 'qobuz' # music download hi-res
# cask 'postman'
# cask 'postman-cli'
# cask 'tad'  # open parquet files
# cask 'xbar'
# cask 'hammerspoon'
# cask 'webtorrent'
# cask 'blackhole-2ch'
# cask 'libreoffice'

# cask 'amethyst' # window manager, using hammerspoon for window management for now
# cask 'mounty' # write NFS drives on mac: using paragon now
# cask 'carbon-copy-cloner' # using version 5.0
# cask 'progressive-downloader'
# cask 'jdownloader'
# cask 'folx'
# cask 'bitwig-studio' # update manually, releases are often.
# cask 'rectangle' # move screen to left + right monitor, using hammerspoon

# brew 'ntfs-3g-mac' # write NTFS drives. using NTFS Paragon I have licensed
# swiftdefaultappsprefpane # link trigger register URL scheme
# koekeishiya/formulae/yabai
# brew 'rust' # DON"T NEED BECAUSE RUSTUP COMES WITH RUST
# brew "pushtotalk" # push to talk app that works with zoom, used for uni voice calls

# brew 'zplug'
# brew 'unar' # the unarchiver CLI
# brew 'mysql'


# brew 'sshfs' # linux only
# brew 'neovim'
# brew 'vim'
# brew 'git-lfs'
# brew 'duckdb' # needed for tad parquet file viewer
# brew 'cmake'  # make for C++ projects
# brew 'parquet-tools'  # view parquet files in console