#!/bin/bash
#SBATCH--partition=trc
#SBATCH--time=12:00:00
#SBATCH--ntasks=1
#SBATCH--cpus-per-task=2

ml system
ml ffmpeg

mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10022019/analysis/testfolder'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10022019/Video2.m4v' -filter:v "crop=2322:1812:81:189" '/oak/stanford/groups/trc/data/Ashley2/PER/10022019/analysis/Video_2/V02frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10022019/Video3.m4v' -filter:v "crop=2322:1812:81:189" '/oak/stanford/groups/trc/data/Ashley2/PER/10022019/analysis/Video_3/V03frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10022019/Video4.m4v' -filter:v "crop=2304:1992:45:54" '/oak/stanford/groups/trc/data/Ashley2/PER/10022019/analysis/Video_4/V04frame_%07d.jpg'

ffmpeg -i "/oak/stanford/groups/trc/data/Ashley2/PER/10022019/Video5.m4v" -filter:v "crop=2304:1992:45:54" "/oak/stanford/groups/trc/data/Ashley2/PER/10022019/analysis/Video_5/V05frame_%07d.jpg"

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10022019/Video6.m4v' -filter:v "crop=2304:1992:45:54" '/oak/stanford/groups/trc/data/Ashley2/PER/10022019/analysis/Video_6/V06frame_%07d.jpg'







