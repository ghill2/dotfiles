echo "Installing Git..."
brew install git


echo "Git config"

git config --global user.name "George Hill"
git config --global user.email georgehill010@gmail.com

# https://stackoverflow.com/a/62653400
# Avoid
# Pulling without specifying how to reconcile divergent branches is discouraged.
"""
warning: Pulling without specifying how to reconcile divergent branches is
discouraged. You can squelch this message by running one of the following
commands sometime before your next pull:

  git config pull.rebase false  # merge (the default strategy)
  git config pull.rebase true   # rebase
  git config pull.ff only       # fast-forward only

You can replace "git config" with "git config --global" to set a default
preference for all repositories. You can also pass --rebase, --no-rebase,
or --ff-only on the command line to override the configured default per
invocation.
"""
git config --global pull.ff only # fast-forward only
git config --global pull.ff true

git config --global core.editor "code --wait"

"""
FIX:
tests/unit_tests/persistence/test_batching.py: marked executable but has no (or invalid) shebang!
  If it isn't supposed to be executable, try: `chmod -x tests/unit_tests/persistence/test_batching.py`
  If on Windows, you may also need to: `git add --chmod=-x tests/unit_tests/persistence/test_batching.py`
  If it is supposed to be executable, double-check its shebang.
# Ignore executable file changes
# https://stackoverflow.com/questions/1580596/how-do-i-make-git-ignore-file-mode-chmod-changes
"""
git config core.fileMode false


"""
Line endings
https://stackoverflow.com/questions/20496084/git-status-ignore-line-endings-identical-files-windows-linux-environment
"""

"""
Set the default pull and push location to be 
"""
# git config --global push.default current

"""
https://spin.atomicobject.com/2020/05/05/git-configurations-default/
If this configuration is set, running git fetch will also run git remote prune afterwards. git remote prune will delete inaccessible Git objects in your local repository that aren’t on remote. Deleting branches on remote but not locally will generate these inaccessible Git objects.
"""
git config --global fetch.prune true
