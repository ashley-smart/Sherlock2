#!/bin/bash
#SBATCH--partition=trc
#SBATCH--time=24:00:00
#SBATCH--ntasks=1
#SBATCH--cpus-per-task=2

ml system
ml ffmpeg

mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_1'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_2'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_3'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_4'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_5'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_6'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_7'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_8'


ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_1_BasleracA2440-35um22467982_20191004_102032237.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_1/V01frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_2_BasleracA2440-35um22467982_20191004_112253067.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_2/V02frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_3_BasleracA2440-35um22467982_20191004_132420387.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_3/V03frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_4_BasleracA2440-35um22467982_20191004_141531631.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_4/V04frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_5_BasleracA2440-35um22467982_20191004_154736865.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_5/V05frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_6_BasleracA2440-35um22467982_20191004_162839844.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_6/V06frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_7_Basler acA2440-35um22467982_20191004_171708333.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_7/V07frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/Video_8_BasleracA2440-35um22467982_20191004_180753365.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10042019/analysis/Video_8/V08frame_%07d.jpg'


mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/analysis'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/analysis/Video_1NL'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/analysis/Video_2NL'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/analysis/Video_3NL'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/analysis/Video_4NL'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/analysis/Video_5NL'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/analysis/Video_6NL'


ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/NL_Video_1_BasleracA2440-35um22467982_20191008_101005044.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/analysis/Video_1NL/V01frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/NL_Video_2_BasleracA2440-35um22467982_20191008_110705453.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/analysis/Video_2NL/V02frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/NL_Video_3_BasleracA2440-35um22467982_20191008_122209483.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/analysis/Video_3NL/V03frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/NL_Video_4_BasleracA2440-35um22467982_20191008_134813935.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/analysis/Video_4NL/V04frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/NL_Video_5_BasleracA2440-35um22467982_20191008_152624416.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/analysis/Video_5NL/V05frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/NL_Video_6_BasleracA2440-35um22467982_20191008_170004665.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10082019/analysis/Video_6NL/V06frame_%07d.jpg'


mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10092019/analysis'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10092019/analysis/Video_1'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10092019/analysis/Video_2'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10092019/analysis/Video_3'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10092019/Video_1_BasleracA2440-35um22467982_20191009_131539580.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10092019/analysis/Video_1/V01frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10092019/Video_2_BasleracA2440-35um22467982_20191009_144110253.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10092019/analysis/Video_2/V02frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10092019/Video_3_BasleracA2440-35um22467982_20191009_160027218.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10092019/analysis/Video_3/V03frame_%07d.jpg'


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


mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10112019/analysis'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10112019/analysis/Video_1'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10112019/analysis/Video_2'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10112019/analysis/Video_3'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10112019/analysis/Video_4'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10112019/Video_1_BasleracA2440-35um22467982_20191011_105609261.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10112019/analysis/Video_1/V01frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10112019/Video_2_BasleracA2440-35um22467982_20191011_131027269.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10112019/analysis/Video_2/V02frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10112019/Video_3_BasleracA2440-35um22467982_20191011_143856684.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10112019/analysis/Video_3/V03frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10112019/Video_4_BasleracA2440-35um22467982_20191011_160309715.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10112019/analysis/Video_4/V04frame_%07d.jpg'


mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/NL_1'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/NL_2'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/Video_1'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/Video_2'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/Video_3'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/Video_4'
mkdir '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/Video_5'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/NL_1_BasleracA2440-35um22467982_20191016_101546447.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/NL_1/NLV01frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/NL_2_BasleracA2440-35um22467982_20191016_112518397.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/NL_2/NLV02frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/Video_1_BasleracA2440-35um22467982_20191016_114853446.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/Video_1/V01frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/Video_2_BasleracA2440-35um22467982_20191016_124946181.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/Video_2/V02frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/Video_3_BasleracA2440-35um22467982_20191016_141725832.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/Video_3/V03frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/Video_4_BasleracA2440-35um22467982_20191016_150137049.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/Video_4/V04frame_%07d.jpg'

ffmpeg -i '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/Video_5_BasleracA2440-35um22467982_20191016_164327808.m4v' '/oak/stanford/groups/trc/data/Ashley2/PER/10162019/analysis/Video_5/V05frame_%07d.jpg'