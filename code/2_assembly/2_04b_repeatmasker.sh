#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -J 2_04_repeatmasker
#SBATCH --mail-type=ALL

module load RepeatMasker/4.2.1-foss-2024a

# want it to write output to nobackup so i will work in:
cd /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_04_repeatmasker/

RepeatMasker \
-nolow -xsmall \
-lib -n_japonicum-families.fa \
/proj/uppmax2026-1-61/nobackup/work/aljo6352/2_03_pilon/2_03_pilon.fasta
