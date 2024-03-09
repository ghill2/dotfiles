
# Add package repositories
sudo zypper addrepo http://download.opensuse.org/distribution/leap/15.5/repo/non-oss/ opensuse-non-oss
sudo zypper addrepo http://download.opensuse.org/distribution/leap/15.5/repo/oss/ opensuse-oss

# Add packages
sudo zypper install git

# Install Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'
sudo zypper refresh
sudo zypper install code

# Install pyenv
sudo zypper install -y gcc make patch gdbm-devel openssl-devel bzip2 readline-devel sqlite3-devel zlib-devel libffi-devel
sudo zypper install pyenv
pyenv install 3.10.7
pyenv global 3.10.7

# Install pyenv
git config --global user.name "George Hill"
git config --global user.email "georgehill010@gmail.com"

