#!/bin/bash

#SBATCH --partition=bgmp            ### Partition
#SBATCH --job-name=fastqc%j         ### Job Name
#SBATCH --output=fastqc%j.out       ### File in which to store job output
#SBATCH --error=fastqc%j.err        ### File in which to store job error messages
#SBATCH --nodes=1                   ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=1         ### Number of tasks to be launched per Node
#SBATCH --cpus-per-task=4           ### Number of cpus per node
#SBATCH --account=bgmp              ### Account used for job submission

# fastqc seqfile1 seqfile2 .. seqfileN
# fastqc [-o output dir] [--(no)extract] [-f fastq|bam|sam] [-c contaminant file] seqfile1 .. seqfileN

trim_seq22r1="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_22/22_3H_both_S16_L008_R1_001_paired.fastq.gz"
trim_seq22r2="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_22/22_3H_both_S16_L008_R2_001_paired.fastq.gz"
trim_seq8r1="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_8/8_2F_fox_S7_L008_R1_001_paired.fastq.gz"
trim_seq8r2="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_8/8_2F_fox_S7_L008_R2_001_paired.fastq.gz"
outDir="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-7_fastqc/"

ml fastqc/0.11.5

/usr/bin/time -v fastqc \
    -t 4 \
    -o $outDir \
    $trim_seq22r1 $trim_seq22r2 $trim_seq8r1 $trim_seq8r2