#!/bin/bash
#SBATCH--partition=trc
#SBATCH--time=12:00:00
#SBATCH--ntasks=1
#SBATCH--cpus-per-task=2

ml system
ml ffmpeg

mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/20191210/avi'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/20191210/Video1.m4v'  -sameq '/oak/stanford/groups/trc/data/Ashley2/PER/10022019/avi/Video_1.avi'

