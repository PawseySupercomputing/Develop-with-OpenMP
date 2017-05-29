#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --account=courses01
#SBATCH --reservation=courseq
#SBATCH --job-name=openmp-ex2
#SBATCH --time=00:20:00
#SBATCH --export=NONE


aprun -n 1 ./pi-serial.out

