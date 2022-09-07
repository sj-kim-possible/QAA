#!/bin/bash

#SBATCH --partition=bgmp            ### Partition
#SBATCH --job-name=fastqc%j         ### Job Name
#SBATCH --output=fastqc%j.out       ### File in which to store job output
#SBATCH --error=fastqc%j.err        ### File in which to store job error messages
#SBATCH --nodes=1                   ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=1         ### Number of tasks to be launched per Node
#SBATCH --cpus-per-task=4           ### Number of cpus per node
#SBATCH --account=bgmp              ### Account used for job submission
#SBATCH --mail-type=ALL             ### Notify user by email when certain events occur
#SBATCH --mail-user=${skim6}@uoregon.edu

# fastqc seqfile1 seqfile2 .. seqfileN
# fastqc [-o output dir] [--(no)extract] [-f fastq|bam|sam] [-c contaminant file] seqfile1 .. seqfileN

seq22r1="/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R1_001.fastq.gz"
seq22r2="/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R2_001.fastq.gz"
seq8r1="/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz"
seq8r2="/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz"
outDir="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part1_qc_output/"

ml fastqc/0.11.5

/usr/bin/time -v fastqc \
    -t 4 \
    -o $outDir \
    $seq22r1 $seq22r2 $seq8r1 $seq8r2
