#!/bin/bash
#SBATCH --job-name=flag_check
#SBATCH --partition=trc
#SBATCH --time=0:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=3
#SBATCH --output=./outputs_readrois/slurm-%j.out
#SBATCH -e readROISerr_%A_%a.err # Redirect STDERR to file

ml gcc/6.3.0
ml python/3.6.1
#ml py-numpy/1.14.3_py36
#ml py-pandas/0.23.0_py36
#ml viz
#ml py-scikit-learn/0.19.1_py36


#ml opencv
#ml py-scipy
ml system
#ml ffmpeg
#ml python/3.6.1

#check these are real modules
##ml matplotlib

#ml csv
# ml json
# ml pickle
#ml read_roi

echo "about to start python"

python3 /home/users/asmart/scripts/Sherlock2/read_rois_jpeg.py
