#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J 2_05_busco
#SBATCH --mail-type=ALL

cd /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_05_qc/

module load BUSCO

busco -i /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_04_repeatmasker/2_04_rm.fasta.masked \
-m genome -c 2 --out 2_05_maskedQC \
-l embryophyta_odb10

busco -i /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_03_pilon/2_03_pilon.fasta \
-m genome -c 2 --out 2_05_unmaskedQC \
-l embryophyta_odb10

busco -i /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_01_canu/2_01_canu.contigs.fasta \
-m genome -c 2 --out 2_05_unpolishedQC \
-l embryophyta_odb10
