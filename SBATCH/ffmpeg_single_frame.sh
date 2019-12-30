#!/bin/bash
#SBATCH--partition=trc
#SBATCH--time=2:00:00
#SBATCH--ntasks=1
#SBATCH--cpus-per-task=1

ml system
ml ffmpeg

ffmpeg -ss 00:00:01 -i "oak\stanford\groups\trc\data\Ashley2\PER\10022019\Video_1.m4v" -vframes 1 -q:v 2 "oak\stanford\groups\trc\data\Ashley2\PER\10022019\analysis\Video_1_test2.jpg"
