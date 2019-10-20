git clone https://github.com/StanfordSNR/pantheon.git
#git clone https://github.com/albararamli/pantheon.git
cd pantheon/
./tools/fetch_submodules.sh
./tools/install_deps.sh
src/experiments/setup.py --install-deps --all
src/experiments/setup.py --setup --all
src/experiments/setup.py --all
sudo sysctl -w net.ipv4.ip_forward=1
cd third_party
sudo rm -R indigo
git clone https://github.com/albararamli/indigo.git
