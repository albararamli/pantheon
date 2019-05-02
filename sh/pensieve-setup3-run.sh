cd pensieve/sim/
cp -R ./results/* ../test/models
cd ../test/
python get_video_sizes.py
cp -R ../sim/cooked_test_traces ./cooked_traces
# for pensive scheme use sim_rl in the file: SCHEMES = ['sim_rl',’sim_bb’,’sim_mpc’]
python rl_no_training.py
python bb.py
python mpc.py
rm fig/*
python plot_results.py
