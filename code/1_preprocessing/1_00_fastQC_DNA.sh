#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:20:00
#SBATCH -J 1_00_fastQC_DNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user=aljo6352@student.uu.se

#load modules

module load FastQC

#define variables/paths

BASEPATH="{$HOME}/genome_analysis/project_GA/"
INPUT_R1="{$BASEPATH}/data/raw_data/chr3_illumina_R1.fq.gz"
INPUT_R2="{$BASEPATH}/data/raw_data/chr3_illumina_R2.fq.gz"

OUTPATH="{$BASEPATH}/analyses_outpuits/1_preprocessing/1_00_fastQC_DNA/"

#run 
fastqc INPUT_R1 -o OUTPATH
fastqc INPUT_R2 -o OUTPATH
