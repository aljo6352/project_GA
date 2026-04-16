#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J 2_02_bwa
#SBATCH --mail-type=ALL

module load BWA/0.7.19-GCCcore-13.3.0

#first we need to create a BWA index

bwa index [-a bwtsw|is] input_reference.fasta index_prefix
# input-reference is the file by canu with the contigs (i think).
#-a is defined by the size of this file. if < 2GB use is, if larger use bwtsw.
bwa mem index_prefix [input_reads.fastq|\
/home/aljo6352/genome_analysis/project_GA/data/processed_data/1_01_trimmed_DNA/R1_paired.fq.gz /home/aljo6352/genome_analysis/project_GA/data/processed_data/1_01_trimmed_DNA/R2_paired.fq.gz \ 
-t 2 > #output name
