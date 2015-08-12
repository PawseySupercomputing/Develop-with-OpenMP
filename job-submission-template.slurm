#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --account=courseq
#SBATCH --job-name=openmp-tutorial
#SBATCH --cpus-per-task=4
#SBATCH --time=00:20:00
#SBATCH --export=NONE

# To change the number of threads, alter the cpus-per-task directive 
# for SBATCH and the variable OMP_NUM_THREADS  
export OMP_NUM_THREADS=4

aprun -n 1 -d ${OMP_NUM_THREADS} -j 1 ./hello-omp

