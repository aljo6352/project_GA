#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J 4_01_hisat
#SBATCH --mail-type=ALL
#SBATCH --reservation=uppmax2026-1-61_9

cd /proj/uppmax2026-1-61/nobackup/work/aljo6352/4_01_hisat/

module load HISAT2/2.2.1-gompi-2024a
module load SAMtools

GENOME=/proj/uppmax2026-1-61/nobackup/work/aljo6352/2_04_repeatmasker/2_04_rm.fasta.masked
C2_R1=/home/aljo6352/genome_analysis/project_GA/data/raw_data/transcriptome_control_2_R1.fq.gz
C2_R2=/home/aljo6352/genome_analysis/project_GA/data/raw_data/transcriptome_control_2_R2.fq.gz
T2_R1=/home/aljo6352/genome_analysis/project_GA/data/raw_data/transcriptome_treated_2_R1.fq.gz
T2_R2=/home/aljo6352/genome_analysis/project_GA/data/raw_data/transcriptome_treated_2_R2.fq.gz
C3_R1=/home/aljo6352/genome_analysis/project_GA/data/raw_data/transcriptome_control_3_R1.fq.gz
C3_R2=/home/aljo6352/genome_analysis/project_GA/data/raw_data/transcriptome_control_3_R2.fq.gz
T3_R1=/home/aljo6352/genome_analysis/project_GA/data/raw_data/transcriptome_treated_3_R1.fq.gz
T3_R2=/home/aljo6352/genome_analysis/project_GA/data/raw_data/transcriptome_treated_3_R2.fq.gz

#first we generate an index file

hisat2-build $GENOME genome_index


#Then we can run hisat

hisat2 -x genome_index -1 $C2_R1 -2 $C2_R2 | samtools view -bS > 4_01_control2.bam
samtools sort 4_01_control2.bam > 4_01_control2.sorted.bam
samtools index 4_01_control2.sorted.bam

hisat2 -x genome_index -1 $T2_R1 -2 $T2_R2 | samtools view -bS > 4_01_treated2.bam
samtools sort 4_01_treated2.bam > 4_01_treated2.sorted.bam
samtools index 4_01_treated2.sorted.bam

hisat2 -x genome_index -1 $C3_R1 -2 $C3_R2 | samtools view -bS > 4_01_control3.bam
samtools sort 4_01_control3.bam > 4_01_control3.sorted.bam
samtools index 4_01_control3.sorted.bam

hisat2 -x genome_index -1 $T3_R1 -2 $T3_R2 | samtools view -bS > 4_01_treated3.bam
samtools sort 4_01_treated3.bam > 4_01_treated3.sorted.bam
samtools index 4_01_treated3.sorted.bam
