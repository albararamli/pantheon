cd ~/pantheon

src/experiments/setup.py --all
sudo sysctl -w net.ipv4.ip_forward=1
 
src/wrappers/indigo.py sender 7777
src/wrappers/indigo.py receiver 127.0.0.1 7777
python proxy/proxy.py 9999

#src/experiments/test.py local --schemes indigo
#python proxy/proxy2.py 4444
