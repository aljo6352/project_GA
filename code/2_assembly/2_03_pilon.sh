#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 24:00:00
#SBATCH -J 2_03_pilon
#SBATCH --mail-type=ALL

module load Pilon/1.24-Java-17

pilon --genome [genome.fasta] --frags [frags.bam] --threads 2 --output [prefix] --outdir [outdirectory]

# where genome.fasta is the file output by canu. 
# frags.bam is the sam>bam converted file from BWA. 
