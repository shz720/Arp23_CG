#!/bin/bash
#SBATCH -p shared
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=28
#SBATCH -t 48:00:00
#SBATCH -J c-fix_6uhc
#SBATCH -A TG-MCB180021 
#SBATCH -o c-fix_6uhc.%j.%N.out
#SBATCH -e c-fix_6uhc.%j.%N.err
#SBATCH --export=ALL

module purge
module load gpu/0.15.4
module load intel/19.0.5.281
module load intel-mpi/2019.8.254
module load slurm

srun --mpi=pmi2 -n 28 --cpus-per-task=1 /home/szhang94/SRC/lammps-29Oct20/build/lmp_mpi -p 28x1 -in run.lmp
