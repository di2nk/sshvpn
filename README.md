# sshvpn only
# under maintenance
# use with your own risk

# how to use :

apt update && apt upgrade -y && update-grub && sleep 2 && reboot

sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/di2nk/sshvpn/main/ssh-vpn.sh && chmod +x setup.sh && screen -S setup ./setup.sh
