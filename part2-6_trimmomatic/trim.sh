#!/bin/bash

#SBATCH --partition=bgmp            ### Partition
#SBATCH --job-name=trimmomatic%j    ### Job Name
#SBATCH --output=trimmomatic%j.out  ### File in which to store job output
#SBATCH --error=trimmomatic%j.err   ### File in which to store job error messages
#SBATCH --nodes=1                   ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=1         ### Number of tasks to be launched per Node
#SBATCH --cpus-per-task=4           ### Number of cpus per node
#SBATCH --account=bgmp              ### Account used for job submission

#Usage: 
#       PE [-version] [-threads <threads>] [-phred33|-phred64] [-trimlog <trimLogFile>] [-summary <statsSummaryFile>] 
# [-quiet] [-validatePairs] [-basein <inputBase> | <inputFile1> <inputFile2>] [-baseout <outputBase> | 
# <outputFile1P> <outputFile1U> <outputFile2P> <outputFile2U>] <trimmer1>...

# input files from cutadapt:
#22
cutadapt_22_R1="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-5_cutadapt/cutadapt_22/22_3H_both_S16_L008_R1_001_cutadapt.fastq.gz"
cutadapt_22_R2="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-5_cutadapt/cutadapt_22/22_3H_both_S16_L008_R2_001_cutadapt.fastq.gz"
#8
cutadapt_8_R1="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-5_cutadapt/cutadapt_8/8_2F_fox_S7_L008_R1_001_cutadapt.fastq.gz"
cutadapt_8_R2="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-5_cutadapt/cutadapt_8/8_2F_fox_S7_L008_R2_001_cutadapt.fastq.gz"
# output files: 4: paired and unpaired, r1 and r2
#22
trim_paired_22_R1="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_22/22_3H_both_S16_L008_R1_001_paired.fastq.gz"
trim_paired_22_R2="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_22/22_3H_both_S16_L008_R2_001_paired.fastq.gz"
trim_unpaired_22_R1="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_22/22_3H_both_S16_L008_R1_001_unpaired.fastq.gz"
trim_unpaired_22_R2="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_22/22_3H_both_S16_L008_R2_001_unpaired.fastq.gz"
trimlog_22="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_22/trimlog_22.txt"
#8
trim_paired_8_R1="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_8/8_2F_fox_S7_L008_R1_001_paired.fastq.gz"
trim_paired_8_R2="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_8/8_2F_fox_S7_L008_R2_001_paired.fastq.gz"
trim_unpaired_8_R1="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_8/8_2F_fox_S7_L008_R1_001_unpaired.fastq.gz"
trim_unpaired_8_R2="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_8/8_2F_fox_S7_L008_R2_001_unpaired.fastq.gz"
trimlog_8="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_8/trimlog_8.txt"

conda activate QAA

# sample 22:
/usr/bin/time -v trimmomatic PE \
    -threads 4 -phred33 \
    -trimlog $trimlog_22 \
    $cutadapt_22_R1 $cutadapt_22_R2 \
    $trim_paired_22_R1 $trim_unpaired_22_R1 \
    $trim_paired_22_R2 $trim_unpaired_22_R2 \
    LEADING:3 \
    TRAILING:3 \
    SLIDINGWINDOW:5:15 \
    MINLEN:35
echo "sample 22 done trimming"

# sample 8:
/usr/bin/time -v trimmomatic PE \
    -threads 4 -phred33 \
    -trimlog $trimlog_8 \
    $cutadapt_8_R1 $cutadapt_8_R2 \
    $trim_paired_8_R1 $trim_unpaired_8_R1 \
    $trim_paired_8_R2 $trim_unpaired_8_R2 \
    LEADING:3 \
    TRAILING:3 \
    SLIDINGWINDOW:5:15 \
    MINLEN:35
echo "sample 8 done trimming"