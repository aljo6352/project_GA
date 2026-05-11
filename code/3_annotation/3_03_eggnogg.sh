#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 18:00:00
#SBATCH -J 3_03_eggnogg
#SBATCH --mail-type=ALL

module load eggnog-mapper/2.1.13

PROT=/proj/uppmax2026-1-61/nobackup/work/aljo6352/3_02_braker/3_02b_rerun/braker.aa

emapper.py -i $PROT -o 3_03_eggnog --output_dir /proj/uppmax2026-1-61/nobackup/work/aljo6352/3_03_eggnog \
--cpu 2 --go_evidence all --data_dir /sw/data/eggNOG/5.0.0/rackham/
