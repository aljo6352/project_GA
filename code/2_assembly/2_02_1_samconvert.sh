#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n ????????????
#SBATCH -t ??????????????????????
#SBATCH -J 2_02_1_Samtools
#SBATCH --mail-type=ALL


module load SAMtools

samtools view -bS -o /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_02_bwa/2_02_bwa.bam /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_02_bwa/2_02_bwa.sam

samtools sort /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_02_bwa/2_02_bwa.bam \
-o /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_02_bwa/2_02_bwa_sorted.bam

samtools index /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_02_bwa/2_02_bwa_sorted.bam
