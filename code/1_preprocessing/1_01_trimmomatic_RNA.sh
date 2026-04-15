#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J 1_01_trimmomatic_RNA
#SBATCH --mail-type=ALL

#load modules

module load Trimmomatic/0.39-Java-17

#define variables/paths

TRIMMOMATIC=/sw/arch/eb/software/Trimmomatic/0.39-Java-17
INPUT_PATH=/home/aljo6352/genome_analysis/project_GA/data/raw_data
OUTPUT_PATH=/proj/uppmax2026-1-61/nobackup/work/aljo6352/1_01_trimmomatic_RNA


#run
for u in control treated
do
	for i in 1 2 3
	do
	java -jar $TRIMMOMATIC/trimmomatic-0.39.jar PE -threads 2 $INPUT_PATH/transcriptome_${u}_${i}_R1.fq.gz $INPUT_PATH/transcriptome_${u}_${i}_R2.fq.gz \
	$OUTPUT_PATH/${u}_${i}_R1_paired.fq.gz $OUTPUT_PATH/${u}_${i}_R1_unpaired.fq.gz \
	$OUTPUT_PATH/${u}_${i}_R2_paired.fq.gz $OUTPUT_PATH/${u}_${i}_R2_unpaired.fq.gz \
	ILLUMINACLIP:$TRIMMOMATIC/adapters/TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
	wait
	done
done
