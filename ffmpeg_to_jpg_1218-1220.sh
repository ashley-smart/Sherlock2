#!/bin/bash
#SBATCH--partition=trc
#SBATCH--time=2:00:00
#SBATCH--ntasks=1
#SBATCH--cpus-per-task=3
#SBATCH --output=./outputs_ffmpeg/slurm-%j.out

#gets frame every 10 seconds

ml system
ml ffmpeg


ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/20191218/Video_1.m4v' -vf fps=1/10 '/oak/stanford/groups/trc/data/Ashley2/PER/20191218/analysis/Video1/V01frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/20191220/Video_1.m4v' -vf fps=1/10 '/oak/stanford/groups/trc/data/Ashley2/PER/20191220/analysis/Video1/V01frame_%07d.jpg'
