#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --account=courses01
#SBATCH --reservation=courseq
#SBATCH --job-name=openmp-exe1
#SBATCH --time=00:20:00
#SBATCH --export=NONE

export OMP_NUM_THREADS=5

aprun -n 1 -d ${OMP_NUM_THREADS} -j 1 ./hello-omp.out

