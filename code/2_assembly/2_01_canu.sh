#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 30:00:00
#SBATCH -J 2_01_canu
#SBATCH --mail-type=ALL

#load modules
module load canu/2.3-GCCcore-13.3.0-Java-17

module load SAMtools/1.22.1-GCC-13.3.0

samtools=/sw/arch/eb/modules/all/SAMtools/1.22.1-GCC-13.3.0.lua

#run
canu -p 2_01_canu -d /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_01_canu \
genomeSize=16m gridOptions="-A uppmax2026-1-61 -M pelle -t 12:00:00" \
maxThreads=2 corThreads=2 oeaThreads=2 cnsThreads=2 \
-nanopore /home/aljo6352/genome_analysis/project_GA/data/raw_data/chr3_nanopore_clean.fq.gz

#make soft links back to home
cd /home/aljo6352/genome_analysis/project_GA/data/processed_data/2_01_canu
ln -s /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_01_canu/*fasta*
cd /home/aljo6352/genome_analysis/project_GA/analyses_outputs/2_assembly/2_01_canu
ln -s /proj/uppmax2026-1-61/nobackup/work/aljo6352/2_01_canu/*report
