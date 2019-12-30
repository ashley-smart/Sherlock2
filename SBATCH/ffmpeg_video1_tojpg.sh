#!/bin/bash
#SBATCH--partition=trc
#SBATCH--time=2:00:00
#SBATCH--ntasks=1
#SBATCH--cpus-per-task=1

ml system
ml ffmpeg


ffmpeg -i '/oak\stanford\groups\trc\data\Ashley2\PER\10022019\Video1.m4v' -filter:v "crop=2322:1812:81:189" 'oak\stanford\groups\trc\data\Ashley2\PER\10022019\analysis\Video1\V01frame_%%07d.jpg'