#!/bin/bash
#SBATCH--partition=trc
#SBATCH--time=2:00:00
#SBATCH--ntasks=1
#SBATCH--cpus-per-task=3
#SBATCH --output=./outputs_ffmpeg/slurm-%j.out



ml system
ml ffmpeg


ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/20191210/Video_1.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/20191210/analysis/Video1/V01frame_%07d.jpg'