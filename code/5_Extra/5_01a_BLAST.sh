#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J 5_01a_blast
#SBATCH --mail-type=ALL

module load BLAST+/2.17.0-gompi-2024a

makeblastdb -in C_purpureus.fna -dbtype nucl

blastn -query 2_04_rm.fasta.masked -db C_purpureus.fna -evalue 1 -task megablast -outfmt 6 -out 5_01_blast
