#!/bin/bash -l 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 1
#SBATCH -t 02:00:00
#SBATCH -J 1_01_trimmomatic_DNA
#SBATCH --mail-type=ALL

#load modules 

module load Trimmomatic/0.39-Java-17

#define variables/paths

TRIMMOMATIC="/sw/arch/eb/software/Trimmomatic/0.39-Java-17"  
LOG="/home/aljo6352/genome_analysis/project_GA/analyses_outputs/1_preprocessing/1_01_trimmomatic_DNA/1_01_DNA_log.txt"
INPUT_R1="/home/aljo6352/genome_analysis/project_GA/data/raw_data/chr3_illumina_R1.fq.gz"
INPUT_R2="/home/aljo6352/genome_analysis/project_GA/data/raw_data/chr3_illumina_R2.fq.gz"

FP="/home/aljo6352/genome_analysis/project_GA/data/processed_data/1_01_trimmed_DNA/R1_paired.fq.gz"
RP="/home/aljo6352/genome_analysis/project_GA/data/processed_data/1_01_trimmed_DNA/R2_paired.fq.gz"
FUP="/home/aljo6352/genome_analysis/project_GA/data/processed_data/1_01_trimmed_DNA/R1_unpaired.fq.gz"
RUP="/home/aljo6352/genome_analysis/project_GA/data/processed_data/1_01_trimmed_DNA/R2_unpaired.fq.gz"


#run
java -jar $TRIMMOMATIC/trimmomatic-0.39.jar PE $INPUT_R1 $INPUT_R2 $FP $FUP $RP $RUP ILLUMINACLIP:$TRIMMOMATIC/adapters/TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 > $LOG
