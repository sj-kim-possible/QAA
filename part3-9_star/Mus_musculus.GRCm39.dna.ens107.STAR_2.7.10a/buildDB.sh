#!/bin/bash

#SBATCH --partition=bgmp         ### Partition
#SBATCH --job-name=starDB%j      ### Job Name
#SBATCH --output=starDB%j.out    ### File in which to store job output
#SBATCH --error=starDB%j.err     ### File in which to store job error messages
#SBATCH --nodes=1                ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=1      ### Number of tasks to be launched per Node
#SBATCH --cpus-per-task=8        ### Number of cpus per node
#SBATCH --account=bgmp           ### Account used for job submission

genomeDir="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part3-9_star/Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a/"
fasta="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part3-9_star/mus/Mus_musculus.GRCm39.dna.primary_assembly.fa"
gtf="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part3-9_star/Mus_musculus.GRCm39.107.gtf"

/usr/bin/time -v STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir $genomeDir \
--genomeFastaFiles $fasta \
--sjdbGTFfile $gtf