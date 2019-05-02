cd ~/pantheon/
# after reboot
src/experiments/setup.py --all
sudo sysctl -w net.ipv4.ip_forward=1
src/experiments/test.py local --all --data-dir pat
src/analysis/analyze.py --data-dir pat
