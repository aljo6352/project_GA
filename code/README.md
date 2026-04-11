Here in the code folder there will be a subfolder for each general step of the workflow. Each subfolder contains the following methods and their code:
1.  Preprocessing
	- 1_00 quality check (DNA and RNA) 
	- 1_01 Trimming
	- 1_02 Quality check
2. Genome assembly
	- assembly from long-read data 
	- Align illumina to assembled contigs
	- polish with the illumina data 
	- Mask repeats
	- Quality assessment
	- annotation
3. Differential expression analysis
	- Mapping of RNAseq data
	- counting features
	- DE analysis
4. Extra analysis 
	- Gene enrichment analysis
	- Plot syntety with _C. purpureus_
