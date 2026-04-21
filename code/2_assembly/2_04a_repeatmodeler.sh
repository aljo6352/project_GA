#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J 2_04a_repeatmodeler
#SBATCH --mail-type=ALL

module load RepeatModeler/2.0.7-foss-2024a

cd /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_04_repeatmasker

BuildDatabase -name -n_japonicum \
/proj/uppmax2026-1-61/nobackup/work/aljo6352/2_03_pilon/2_03_pilon.fasta

RepeatModeler -database -n_japonicum \
-LTRStruct > out.log
