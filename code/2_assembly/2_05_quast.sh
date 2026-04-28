#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J 2_05_quast
#SBATCH --mail-type=ALL

cd /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_05_qc/

module load QUAST

quast.py -o quast_unpolished /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_01_canu/2_01_canu.contigs.fasta

quast.py -o quast_polished /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_03_pilon/2_03_pilon.fasta
