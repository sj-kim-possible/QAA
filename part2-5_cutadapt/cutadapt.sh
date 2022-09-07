#!/bin/bash

#SBATCH --partition=bgmp            ### Partition
#SBATCH --job-name=cutadapt%j       ### Job Name
#SBATCH --output=cutadapt%j.out     ### File in which to store job output
#SBATCH --error=cutadapt%j.err      ### File in which to store job error messages
#SBATCH --nodes=1                   ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=1         ### Number of tasks to be launched per Node
#SBATCH --cpus-per-task=1           ### Number of cpus per node
#SBATCH --account=bgmp              ### Account used for job submission

#For paired-end reads:
#    cutadapt -a ADAPT1 -A ADAPT2 [options] -o out1.fastq -p out2.fastq in1.fastq in2.fastq

r1_adapt="AGATCGGAAGAGCACACGTCTGAACTCCAGTCA"
r2_adapt="AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT"
demuxd22_R1="/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R1_001.fastq.gz"
demuxd22_R2="/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R2_001.fastq.gz"
demuxd8_R1="/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz"
demuxd8_R2="/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz"
out22_R1="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-5_cutadapt/cutadapt_22/22_3H_both_S16_L008_R1_001_cutadapt.fastq.gz"
out22_R2="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-5_cutadapt/cutadapt_22/22_3H_both_S16_L008_R2_001_cutadapt.fastq.gz"
out8_R1="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-5_cutadapt/cutadapt_8/8_2F_fox_S7_L008_R1_001_cutadapt.fastq.gz"
out8_R2="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-5_cutadapt/cutadapt_8/8_2F_fox_S7_L008_R2_001_cutadapt.fastq.gz"

conda activate QAA

# sample 22:
/usr/bin/time -v cutadapt \
    -a $r1_adapt \
    -A $r2_adapt \
    -o $out22_R1 \
    -p $out22_R2 \
    $demuxd22_R1 \
    $demuxd22_R2 
echo "done with sample 22"

# sample 8:
/usr/bin/time -v cutadapt \
    -a $r1_adapt \
    -A $r2_adapt \
    -o $out8_R1 \
    -p $out8_R2 \
    $demuxd8_R1 \
    $demuxd8_R2 
echo "done with sample 8"
