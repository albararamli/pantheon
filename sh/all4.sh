# to see what is supported by linux:  reno cubic bbr
sysctl net.ipv4.tcp_available_congestion_control
# what do we use now?
sysctl net.ipv4.tcp_congestion_control
# to change it, go to
sudo nano /etc/sysctl.conf
# the add
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr

gnome-terminal -e 'sh -c "python third_party/indigo/env/proxy.py 9999;exec bash"'
