yes | sudo apt-get update
yes | sudo apt install git curl unzip python
#sudo apt-get install python-pip
#pip install tensorflow==1.1.0
#pip install tflearn==0.3.1
#pip install selenium==2.39.0
sudo apt-get --only-upgrade install google-chrome-stable
git clone https://github.com/albararamli/pensieve.git #https://github.com/hongzimao/pensieve.git
curl -L -o ddd.zip https://www.dropbox.com/sh/ss0zs1lc4cklu3u/AAB-8WC3cHD4PTtYT0E4M19Ja?dl=0
unzip -q ddd.zip
mv train_sim_traces pensieve/sim/cooked_traces
mv test_sim_traces pensieve/sim/cooked_test_traces
cd pensieve
sudo chmod -R 0777 .
python setup.py
pip install --upgrade pip
pip3 install selenium
pip3 install PyVirtualDisplay
cd sim
python get_video_sizes.py
cd ../../
mv cooked_traces pensieve/
