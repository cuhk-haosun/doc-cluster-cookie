#!/bin/bash
#SBATCH --job-name=test_gpu_job       # Job name
#SBATCH --partition=sun_gpu               # Partition (queue) name
#SBATCH --gres=gpu:4                  # Request 4 GPUs
#SBATCH --ntasks=1                    # Run a single task
#SBATCH --cpus-per-task=8             # Number of CPU cores per task
#SBATCH --mem=1G                     # Total memory for the job
#SBATCH --time=01:00:00               # Time limit hrs:min:sec
#SBATCH --output=job_%j.log           # Standard output and error log (%j expands to jobID)

# Load any necessary modules (if using a module system)
# module load cuda/11.0

date

# Print some info about the job
echo "Job started on $(hostname) at $(date)"
echo "Running on GPUs: $CUDA_VISIBLE_DEVICES"

# Run your GPU application
nvidia-smi

# Simulate some GPU computation
sleep 60

echo "Job finished at $(date)"
