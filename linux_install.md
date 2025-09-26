sudo systemctl enable sshd
sudo systemctl status sshd

sudo hostnamectl set-hostname ai


# Add the tailscale repository
sudo zypper ar -g -r https://pkgs.tailscale.com/stable/opensuse/leap/15.5/tailscale.repo
# Install Tailscale
sudo zypper ref && sudo zypper in tailscale
# Enable and start tailscaled
sudo systemctl enable --now tailscaled
# Start Tailscale!
sudo tailscale up

# configure network

ethernet adapter settings

IPv4 Method -> Manual

Address: 192.168.0.99
Network: 255.255.255.0
Gateway: 192.168.0.1

Identity -> Firewall Zone: trusted
