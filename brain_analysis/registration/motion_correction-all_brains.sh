#!/bin/bash
#
#SBATCH --mail-type=END,FAIL
#SBATCH --job-name=motion_correct
#SBATCH --partition=trc
#SBATCH --time=72:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --output=/home/users/asmart/scripts/Sherlock2/brain_analysis/registration/job_outputs/%x.%j.out
#SBATCH --open-mode=append

module use /home/groups/trc/modules
module load antspy/0.2.2

python3 /home/users/asmart/scripts/Sherlock2/brain_analysis/registration/motion_correction_all_brains.py
