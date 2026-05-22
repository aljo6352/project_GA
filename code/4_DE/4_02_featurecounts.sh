#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J 4_02_FEATURECOUNTS
#SBATCH --mail-type=ALL
#SBATCH --reservation=uppmax2026-1-61_10

cd /proj/uppmax2026-1-61/nobackup/work/aljo6352/4_02_featurecounts/

module load Subread/2.1.1-GCC-13.3.0

featureCounts -p -a /proj/uppmax2026-1-61/nobackup/work/aljo6352/3_02_braker/3_02b_rerun/braker.gtf \
-o 4_02_counts.txt /proj/uppmax2026-1-61/nobackup/work/aljo6352/3_01_hisat/3_01_control.bam \
/proj/uppmax2026-1-61/nobackup/work/aljo6352/3_01_hisat/3_01_treated.bam \
/proj/uppmax2026-1-61/nobackup/work/aljo6352/4_01_hisat/4_01_control2.bam \
/proj/uppmax2026-1-61/nobackup/work/aljo6352/4_01_hisat/4_01_treated2.bam \
/proj/uppmax2026-1-61/nobackup/work/aljo6352/4_01_hisat/4_01_control3.bam \
/proj/uppmax2026-1-61/nobackup/work/aljo6352/4_01_hisat/4_01_treated3.bam
