#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 24:00:00
#SBATCH -J 2_03_pilon
#SBATCH --mail-type=ALL

module load Pilon/1.24-Java-17

pilon --genome /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_01_canu/2_01_canu.contigs.fasta \
--frags /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_02_bwa/2_02_bwa_sorted.bam \
--threads 2 --output 2_03_pilon \
--outdir /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_03_pilon/

