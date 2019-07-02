# Virtual Box:  enp0s3
# Wifi:         wlp2s0

echo $(/sbin/ip -o -4 addr list wlp2s0 | awk '{print $4}' | cut -d/ -f1) > ip.txt
cd pantheon
gnome-terminal -e 'sh -c "python third_party/indigo/env/proxy.py 9999;exec bash"'
cd ../
#gnome-terminal -e 'sh -c "sh ./pensieve-setup4-mahimahi.sh;exec bash"'
gnome-terminal -e 'sh -c "sh ./pensieve-setup5-real.sh;exec bash"'

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
