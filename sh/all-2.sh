cd pantheon;
src/experiments/setup.py --all
sudo sysctl -w net.ipv4.ip_forward=1
cd third_party
sudo rm -R indigo
git clone https://github.com/albararamli/indigo.git
sudo chmod -R 0777 ./indigo
cd ../../
