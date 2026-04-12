#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 1
#SBATCH -t 00:20:00
#SBATCH -J 1_02_fastQC_DNA
#SBATCH --mail-type=ALL

#load modules

module load FastQC/0.12.1-Java-17

#define variables/paths

INPUT_R1="/home/aljo6352/genome_analysis/project_GA/data/processed_data/1_01_trimmed_DNA/R1_paired.fq.gz"
INPUT_R2="/home/aljo6352/genome_analysis/project_GA/data/processed_data/1_01_trimmed_DNA/R2_paired.fq.gz"

OUTPATH="/home/aljo6352/genome_analysis/project_GA/analyses_outputs/1_preprocessing/1_02_fastQC_DNA/"

#run
fastqc $INPUT_R1 $INPUT_R2 -o $OUTPATH
