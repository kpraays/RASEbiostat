#!/bin/bash
# ====================================
#SBATCH --job-name=process_multiple_dirs
#SBATCH --cpus-per-task=1
#SBATCH --mem=4GB
#SBATCH --time=0-00:29
#SBATCH --output=./slurm_output/direc_%A_%a.out
#SBATCH --mail-user=aayush.kapur@mail.mcgill.ca
#SBATCH --mail-type=ALL
#SBATCH --array=10-60
#SBATCH --account=def-hiroshi
# ====================================
module load python/3.10 scipy-stack
source /home/kapmcgil/projects/def-hiroshi/kapmcgil/symlink_projects_beluga/kapmcgil/.csvkit/bin/activate
cd /home/kapmcgil/projects/def-hiroshi/kapmcgil/symlink_projects_beluga/kapmcgil/RASEbiostat/PA1_3_new_thresholds/PA1/cp-parallel

# Get the array task ID to use as the input argument
input_arg=$SLURM_ARRAY_TASK_ID

# Launch python job with the input argument
(time python cp_calculate.py "/lustre03/project/6008063/neurohub/UKB/Bulk/90004" "$input_arg" "/home/kapmcgil/projects/def-hiroshi/kapmcgil/symlink_projects_beluga/kapmcgil/RASEbiostat/PA1_3_new_thresholds/PA1/job_outputs/data") 2>&1 | tee -a /home/kapmcgil/projects/def-hiroshi/kapmcgil/symlink_projects_beluga/kapmcgil/RASEbiostat/PA1_3_new_thresholds/PA1/job_outputs/logs/"$input_arg".txt
