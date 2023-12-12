# for app store apps use mas search "Blackmagic Disk Speed Test" to search for the id
tap "homebrew/cask"
tap "candid82/brew"  # for joker dependency

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
brew 'npm'
brew 'ta-lib'
brew 'fd'  # linktrigger script
brew 'rust'
brew 'pre-commit'
brew 'lua'
brew 'duti' # set default app for file in terminal
brew 'direnv'
brew 'poetry'
brew 'pyenv'
brew 'iperf'  # test lan speed
brew 'iperf3'  # test lan speed
#  brew "python@3.10"  # managing python versions with pyenv

tap "esolitos/ipa"
brew 'esolitos/ipa/sshpass' # ssh without password prompt
brew 'hudochenkov/sshpass/sshpass' # ssh without password prompt
brew 'defaultbrowser'  # set the default browser from the terminal, used in settings
cask "dotnet-sdk"
brew "openjdk"  # opensource java sdk, identical to oracle java sdk
brew 'virtualenv'  # for pyenv
# brew 'docker'
cask 'docker'
# brew 'klogg'  # log GUI inspector, fails install on m1
cask 'visual-studio-code'
cask 'tailscale'  # Additional Step Afterwards: Security & Private > Allow

#######################################################################

# per machine .Brewfile
# https://github.com/Homebrew/homebrew-bundle/issues/521#issuecomment-509023309
# filepath = "/Users/g1/BU/projects/dotfiles/.Brewfile.#{Socket.gethostname}"
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
# vscode "GitHub.copilot"
vscode "charliermarsh.ruff"
vscode 'ms-vscode.remote-repositories'
vscode "canadaduane.vscode-kmonad"  # kmonad (lisp) syntax highlighting
vscode "entibo.vscode-kmonad-format"  # format kmonad (lisp) files
vscode "pokey.command-server"  # run comands using file based RPC
vscode "ryuta46.multi-command"  # run a sequence of commands from keybindings.json
vscode "Minkey27.pytest-grabber"  # copy pytest path of method to clipboard for pasting to terminal
vscode "pamaron.pytest-runner" # run pytest method and class with action
