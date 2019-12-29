#!/bin/bash
#SBATCH--partition=trc
#SBATCH--time=2:00:00
#SBATCH--ntasks=1
#SBATCH--cpus-per-task=1

#gets frame every 5 seconds

ml system
ml ffmpeg


ffmpeg -i '/oak\stanford\groups\trc\data\Ashley2\PER\20191210\Video_1.m4v' -vf fps=1/5 'oak\stanford\groups\trc\data\Ashley2\PER\20191210\analysis\Video1\V01frame_%%07d.jpg'