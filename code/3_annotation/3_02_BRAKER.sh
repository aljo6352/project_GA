#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J 3_02_BRAKER
#SBATCH --mail-type=ALL


GENOME=/proj/uppmax2026-1-61/nobackup/work/aljo6352/2_04_repeatmasker/2_04_rm.fasta.masked
BAM_CONTROL=/proj/uppmax2026-1-61/nobackup/work/aljo6352/3_01_hisat/3_01_control.sorted.bam
BAM_TREATED=/proj/uppmax2026-1-61/nobackup/work/aljo6352/3_01_hisat/3_01_treated.sorted.bam
BRAKER=/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/braker3.sif

singularity exec -B /proj/uppmax2026-1-61:/proj/uppmax2026-1-61 \
-B /home/aljo6352:/home/aljo6352 \
-B /gorilla/home/aljo6352/bin/augustus_config:/opt/Augustus/config/ \
$BRAKER braker.pl --genome=$GENOME --bam=$BAM_CONTROL,$BAM_TREATED --softmasking --species=n_japonicum --threads=2 \
--workingdir=/proj/uppmax2026-1-61/nobackup/work/aljo6352/3_02_braker/
