#!/bin/bash
#SBATCH--partition=trc
#SBATCH--time=2:00:00
#SBATCH--ntasks=1
#SBATCH--cpus-per-task=3
#SBATCH --output=./outputs_ffmpeg/slurm-%j.out



ml system
ml ffmpeg

## fps 1/10 is 1 frame for 10s

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/20191217/Video_1.m4v' -vf fps=1/10 '/oak/stanford/groups/trc/data/Ashley2/PER/20191217/analysis/Video1/V01frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/20191217/Video_4.m4v' -vf fps=1/10 '/oak/stanford/groups/trc/data/Ashley2/PER/20191217/analysis/Video4/V04frame_%07d.jpg'