#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 1
#SBATCH -t 00:40:00
#SBATCH -J 1_02_fastQC_RNA
#SBATCH --mail-type=ALL

#load modules

module load FastQC/0.12.1-Java-17

#define variables/paths

INPUT_PATH=/proj/uppmax2026-1-61/nobackup/work/aljo6352/1_01_trimmomatic_RNA

OUTPATH=/home/aljo6352/genome_analysis/project_GA/analyses_outputs/1_preprocessing/1_02_fastQC_RNA/

#run
for  file in $INPUT_PATH/*_?_R?_paired.fq.gz
do
fastqc $file -o $OUTPATH
done
