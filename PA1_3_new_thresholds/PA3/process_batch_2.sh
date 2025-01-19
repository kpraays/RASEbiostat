#! /bin/bash
# ====================================
#SBATCH --job-name=process_proportions
#SBATCH --cpus-per-task=8
#SBATCH --mem=20GB
#SBATCH --time=0-02:59
#SBATCH --output=job_logs/process_proportions_%j.out
#SBATCH --mail-user=aayush.kapur@mail.mcgill.ca
#SBATCH --mail-type=ALL
#SBATCH  --account=def-hiroshi
# ====================================
module load python/3.10 scipy-stack
cd /home/kapmcgil/projects/def-hiroshi/kapmcgil/symlink_projects_beluga/kapmcgil/RASEbiostat/PA1_3_new_thresholds/PA3

python /home/kapmcgil/projects/def-hiroshi/kapmcgil/symlink_projects_beluga/kapmcgil/process_PA3_output/convert.py /home/kapmcgil/projects/def-hiroshi/kapmcgil/symlink_projects_beluga/processed_minute/batch_2 /home/kapmcgil/projects/def-hiroshi/kapmcgil/symlink_projects_beluga/kapmcgil/process_PA3_output/assigned_labels/batch_2 /home/kapmcgil/projects/def-hiroshi/kapmcgil/symlink_projects_beluga/kapmcgil/RASEbiostat/PA1_3_new_thresholds/PA3/batch_2
