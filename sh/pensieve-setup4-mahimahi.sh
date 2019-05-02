cd pensieve/
chmod +x abr_browser_dir/chromedriver
cd test/
cd models 
cp * ../../rl_server/results/
cd ../../rl_server
# Vim rl_server_no_training.py
cd ../run_exp
python run_all_traces.py
rm fig/*
python plot_results.py
