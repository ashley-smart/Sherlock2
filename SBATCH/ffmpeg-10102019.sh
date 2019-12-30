#!/bin/bash
#SBATCH--partition=trc
#SBATCH--time=24:00:00
#SBATCH--ntasks=1
#SBATCH--cpus-per-task=2

ml system
ml ffmpeg

mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/analysis'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/analysis/Video_1'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/analysis/Video_2'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/analysis/Video_3'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/analysis/Video_4'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/analysis/Video_4'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/analysis/Video_6'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/Video_1_BasleracA2440-35um22467982_20191010_101540228.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/analysis/Video_1/V01frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/Video_2_BasleracA2440-35um22467982_20191010_105921011.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/analysis/Video_2/V02frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/Video_3_BasleracA2440-35um22467982_20191010_124136818.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/analysis/Video_3/V03frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/Video_4_BasleracA2440-35um22467982_20191010_145955302.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/analysis/Video_4/V04frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/Video_5_BasleracA2440-35um22467982_20191010_160215523.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/analysis/Video_5/V05frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/Video_6_BasleracA2440-35um22467982_20191010_172839259.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10102019/analysis/Video_6/V06f1rame_%07d.jpg'