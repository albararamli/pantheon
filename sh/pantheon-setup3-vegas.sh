cd ~/pantheon/

# after reboot
src/experiments/setup.py --all
sudo sysctl -w net.ipv4.ip_forward=1

# RUN Panthon
src/experiments/test.py local --schemes "vegas" --data-dir pat

# RUN VEGAS
src/wrappers/vegas.py run_first

