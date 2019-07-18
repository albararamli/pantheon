echo $(/sbin/ip -o -4 addr list wlp2s0 | awk '{print $4}' | cut -d/ -f1) > ip.txt
#cd pantheon
#gnome-terminal -e 'sh -c "python third_party/indigo/env/proxy.py 9999;exec bash"'
#cd ../
#gnome-terminal -e 'sh -c "sh ./pensieve-setup4-mahimahi.sh;exec bash"'
gnome-terminal -e 'sh -c "sh ./pensieve-setup5-real.sh;exec bash"'


# to see what is supported by linux:  reno cubic bbr
##sysctl net.ipv4.tcp_available_congestion_control
# what do we use now?
##sysctl net.ipv4.tcp_congestion_control
# to change it, go to
##sudo nano /etc/sysctl.conf
# the add
##net.core.default_qdisc=fq
##net.ipv4.tcp_congestion_control=bbr

# Virtual Box:  enp0s3
# Wifi:         wlp2s0

###echo $(/sbin/ip -o -4 addr list wlp2s0 | awk '{print $4}' | cut -d/ -f1) > ip.txt
####cd pantheon
##/// Now change HTTP PROXY to: 127.0.0.1 and prot: 9999
##/// Also, Ignore hosts: localhost, 127.0.0.0/8, ::1
####gnome-terminal -e 'sh -c "python third_party/indigo/env/proxy.py 9999;exec bash"'
####cd ../
#gnome-terminal -e 'sh -c "sh ./pensieve-setup4-mahimahi.sh;exec bash"'
####gnome-terminal -e 'sh -c "sh ./pensieve-setup5-real.sh;exec bash"'

## test only here
#touch ip.txt
#echo $(/sbin/ip -o -4 addr list wlp2s0 | awk '{print $4}' | cut -d/ -f1) > ip.txt
#ip=$(<ip.txt)
#if test -z "$ip"
#then
#    echo $(/sbin/ip -o -4 addr list enp0s3 | awk '{print $4}' | cut -d/ -f1) > ip.txt
#else
#    echo "N"
#fi
