#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J 3_01_hisat
#SBATCH --mail-type=ALL
#SBATCH --reservation=uppmax2026-1-61_7

cd /proj/uppmax2026-1-61/nobackup/work/aljo6352/3_01_hisat/

module load HISAT2/2.2.1-gompi-2024a
module load SAMtools

GENOME=/proj/uppmax2026-1-61/nobackup/work/aljo6352/2_04_repeatmasker/2_04_rm.fasta.masked
C1_R1=/home/aljo6352/genome_analysis/project_GA/data/raw_data/transcriptome_control_1_R1.fq.gz
C1_R2=/home/aljo6352/genome_analysis/project_GA/data/raw_data/transcriptome_control_1_R2.fq.gz
T1_R1=/home/aljo6352/genome_analysis/project_GA/data/raw_data/transcriptome_treated_1_R1.fq.gz
T1_R2=/home/aljo6352/genome_analysis/project_GA/data/raw_data/transcriptome_treated_1_R2.fq.gz

#first we generate an index file

hisat2-build $GENOME genome_index


#Then we can run hisat

hisat2 -x genome_index -1 $C1_R1 -2 $C1_R2 | samtools view -bS > 3_01_control.bam
samtools sort 3_01_control.bam > 3_01_control.sorted.bam
samtools index 3_01_control.sorted.bam

hisat2 -x genome_index -1 $T1_R1 -2 $T1_R2 | samtools view -bS > 3_01_treated.bam
samtools sort 3_01_treated.bam > 3_01_treated.sorted.bam
samtools index 3_01_treated.sorted.bam
