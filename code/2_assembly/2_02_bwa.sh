#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J 2_02_bwa
#SBATCH --mail-type=ALL

module load BWA/0.7.19-GCCcore-13.3.0

#first we need to create a BWA index

bwa index -p /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_02_bwa/2_02_index -a bwtsw /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_01_canu/2_01_canu.contigs.fasta

#then we can use that to run bwa mem algorithm
bwa mem -t 2 /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_02_bwa/2_02_index \
/proj/uppmax2026-1-61/nobackup/work/aljo6352/2_01_canu/2_01_canu.contigs.fasta\
/home/aljo6352/genome_analysis/project_GA/data/processed_data/1_01_trimmed_DNA/R1_paired.fq.gz \
/home/aljo6352/genome_analysis/project_GA/data/processed_data/1_01_trimmed_DNA/R2_paired.fq.gz \
> /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_02_bwa/2_02_bwa.sam
