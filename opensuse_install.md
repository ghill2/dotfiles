# OS Version:
cat /etc/os-release
NAME="SLED"
VERSION="15-SP5"
VERSION_ID="15.5"
PRETTY_NAME="SUSE Linux Enterprise Desktop 15 SP5"
ID="sled"
ID_LIKE="suse"
ANSI_COLOR="0;32"
CPE_NAME="cpe:/o:suse:sled:15:sp5"
DOCUMENTATION_URL="https://documentation.suse.com/"

# Kernel Version
uname -r
5.14.21-150500.53-default

ROCm supported operating systems: SLES 15 SP4 - 5.14.21-150500


# Add package repositories
sudo zypper addrepo http://download.opensuse.org/distribution/leap/15.3/repo/non-oss/ opensuse-non-oss
sudo zypper addrepo http://download.opensuse.org/distribution/leap/15.3/repo/oss/ opensuse-oss

# Add packages
sudo zypper install git
sudo zypper install nano

# setup ssh keys to access github

ssh-keygen -t rsa -b 4096 -C "georgehill010@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
copy key and add to github ins ettings -> keys

# Install Visual Studio Code
https://code.visualstudio.com/docs/setup/linux#_opensuse-and-slebased-distributions
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'
sudo zypper refresh
sudo zypper install code

# Install pyenv
zypper install gcc automake bzip2 libbz2-devel xz xz-devel openssl-devel ncurses-devel readline-devel zlib-devel tk-devel libffi-devel sqlite3-devel
sudo zypper install pyenv
pyenv install 3.10.7
pyenv global 3.10.7

# Install pyenv
git config --global user.name "George Hill"
git config --global user.email "georgehill010@gmail.com"


# Install poetry
https://python-poetry.org/docs/#installing-with-the-official-installer
make sure `python` is accessible in terminal (install pyenv above) 
curl -sSL https://install.python-poetry.org | python3 -

# Install tailscale
https://tailscale.com/download/linux/opensuse-leap-15.2
sudo zypper ar -g -r https://pkgs.tailscale.com/stable/opensuse/leap/15.2/tailscale.repo
sudo zypper ref
sudo zypper in tailscale
sudo systemctl enable --now tailscaled
sudo tailscale up

# Install ROCm
https://rocm.docs.amd.com/projects/install-on-linux/en/latest/tutorial/quick-start.html#suse-linux-enterprise-server

first command fails but installation is okay, it's just installing perl which is installed by default on linux desktop
sudo zypper addrepo https://download.opensuse.org/repositories/devel:languages:perl/SLE_15_SP5/devel:languages:perl.repo

sudo zypper install kernel-default-devel

- See prerequisites. Adding current user to Video and Render groups
sudo usermod -a -G render,video $LOGNAME
sudo zypper --no-gpg-checks install https://repo.radeon.com/amdgpu-install/6.0.2/sle/15.5/amdgpu-install-6.0.60002-1.noarch.rpm
sudo zypper refresh
sudo zypper install amdgpu-dkms
sudo zypper install rocm
echo "Please reboot system for all settings to take effect."

- after restarting confirm working:
rocm-smi

==================================== ROCm System Management Interface ====================================
============================================== Concise Info ==============================================
Device  [Model : Revision]    Temp    Power  Partitions      SCLK  MCLK   Fan  Perf  PwrCap  VRAM%  GPU%  
        Name (20 chars)       (Edge)  (Avg)  (Mem, Compute)                                               
==========================================================================================================
0       [0x2328 : 0xc1]       42.0°C  13.0W  N/A, N/A        0Mhz  96Mhz  0%   auto  264.0W    7%   1%    
        Navi 21 [Radeon RX 6                                                                              
==========================================================================================================
========================================== End of ROCm SMI Log ===========================================

# Setup SSH

opensuse desktop has openssh installed by default, with the service automatically started at boot.

on client computer from ssh@ g1@<ip adress of server computer> first



# Setup SMB

sudo firewall-cmd --add-service=samba --permanent
sudo firewall-cmd --reload
sudo smbpasswd -a g1
sudo systemctl restart smb
sudo systemctl enable smb

# Install direnv

# Install RVC system packages


- g++ needed for RVC fairseq dependency
sudo zypper install gcc-c++

- needed for RVC
sudo zupper install ffmpeg


