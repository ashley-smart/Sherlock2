#!/bin/bash
#SBATCH--partition=trc
#SBATCH--time=24:00:00
#SBATCH--ntasks=1
#SBATCH--cpus-per-task=2

ml system
ml ffmpeg




ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_1_BasleracA2440-35um22467982_20191004_102032237.m4v' -filter:v "crop=2454:2046:3:3" '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_1/V01frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_2_BasleracA2440-35um22467982_20191004_112253067.m4v' -filter:v "crop=2454:2046:3:3" '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_2/V02frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_3_BasleracA2440-35um22467982_20191004_132420387.m4v' -filter:v "crop=2454:2046:3:3" '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_3/V03frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_4_BasleracA2440-35um22467982_20191004_141531631.m4v' -filter:v "crop=2454:2046:3:3" '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_4/V04frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_5_BasleracA2440-35um22467982_20191004_154736865.m4v' -filter:v "crop=2454:2046:3:3" '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_5/V05frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_6_BasleracA2440-35um22467982_20191004_162839844.m4v' -filter:v "crop=2454:2046:3:3" '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_6/V06frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_7_Basler acA2440-35um22467982_20191004_171708333.m4v' -filter:v "crop=2454:2046:3:3" '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_7/V07frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_8_BasleracA2440-35um22467982_20191004_180753365.m4v' -filter:v "crop=2454:2046:3:3" '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_8/V08frame_%07d.jpg'