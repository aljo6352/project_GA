#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J 2_05_busco
#SBATCH --mail-type=ALL


module load BUSCO

busco -i /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_04_repeatmasker/2_04_rm.fasta.masked \
-m genome -c 2 --out /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_05_qc/2_05 \
-l embryophyta_odb10
