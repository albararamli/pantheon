cd pensieve/
chmod +x abr_browser_dir/chromedriver
cd test/
cd models 
cp * ../../rl_server/results/
cd ../../rl_server
# edit the file to pick the model in rl_server/rl_server_no_training.py
cd ../real_exp
rm fig/*
python run_exp.py
# edit the file in run_exp/plot_results.py to pick the algorithm to display
python plot_results.py
