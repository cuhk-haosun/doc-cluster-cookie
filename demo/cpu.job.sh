#!/bin/bash
#SBATCH --job-name=test_cpu_job         # Job name
#SBATCH --partition=sun_cpu                 # Partition (queue) name
#SBATCH --ntasks=4                      # Number of tasks (typically MPI processes)
#SBATCH --cpus-per-task=2               # Number of CPU cores per task
#SBATCH --mem=1G                       # Total memory for the job
#SBATCH --time=01:00:00                 # Time limit hrs:min:sec
#SBATCH --output=/pool/sun/xpy/logs/cpu_job_%j.log    # Standard output and error log
#SBATCH --error=/pool/sun/xpy/logs/cpu_job_%j.err     # Error log

# Load any necessary modules (if using a module system)
# module load some_cpu_module

# Print some job information
echo "Job started on $(hostname) at $(date)"
echo "Running on ${SLURM_NTASKS} tasks, each with ${SLURM_CPUS_PER_TASK} CPU cores"

# Run your CPU-based application or script here
# For example, using a simple parallel loop to simulate CPU computation
srun bash -c 'for i in $(seq 1 10); do echo "Task $SLURM_PROCID running iteration $i"; sleep 1; done'

echo "Job finished at $(date)"
