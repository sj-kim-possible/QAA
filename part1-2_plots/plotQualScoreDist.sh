#!/bin/bash

#SBATCH --partition=bgmp            ### Partition
#SBATCH --job-name=plotDist%j       ### Job Name
#SBATCH --output=plotDist%j.out     ### File in which to store job output
#SBATCH --error=plotDist%j.err      ### File in which to store job error messages
#SBATCH --nodes=1                   ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=1         ### Number of tasks to be launched per Node
#SBATCH --cpus-per-task=4           ### Number of cpus per node
#SBATCH --account=bgmp              ### Account used for job submission
#SBATCH --mail-type=ALL             ### Notify user by email when certain events occur
#SBATCH --mail-user=${skim6}@uoregon.edu

conda activate bgmp_py310

script="/projects/bgmp/skim6/bioinfo/Bi622/Demultiplex/Assignment-the-first/qualScoreDist.py"
seq22r1="/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R1_001.fastq.gz"
seq22r2="/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R2_001.fastq.gz"
seq8r1="/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz"
seq8r2="/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz"

/usr/bin/time -v $script \
    -f $seq22r1 \
    -l 101 \
    -p "22_3H_both_S16_L008_R1_001.png"
echo "22_R1 done"

/usr/bin/time -v $script \
    -f $seq22r2 \
    -l 101 \
    -p "22_3H_both_S16_L008_R2_001.png"
echo "22_R2 done"

/usr/bin/time -v $script \
    -f $seq8r1 \
    -l 101 \
    -p "8_2F_fox_S7_L008_R1_001.png"
echo "8_R1 done"

/usr/bin/time -v $script \
    -f $seq8r2 \
    -l 101 \
    -p "8_2F_fox_S7_L008_R2_001.png"
echo "8_R2 done"