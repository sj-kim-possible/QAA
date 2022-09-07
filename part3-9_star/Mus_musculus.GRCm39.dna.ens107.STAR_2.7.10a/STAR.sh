#!/bin/bash

#SBATCH --partition=bgmp         ### Partition
#SBATCH --job-name=star%j        ### Job Name
#SBATCH --output=star%j.out      ### File in which to store job output
#SBATCH --error=star%j.err       ### File in which to store job error messages
#SBATCH --nodes=1                ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=1      ### Number of tasks to be launched per Node
#SBATCH --cpus-per-task=8        ### Number of cpus per node
#SBATCH --account=bgmp           ### Account used for job submission

genomeDir="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part3-9_star/Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a/"
read1_22="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_22/22_3H_both_S16_L008_R1_001_paired.fastq.gz"
read2_22="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_22/22_3H_both_S16_L008_R2_001_paired.fastq.gz"
read1_8="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_8/8_2F_fox_S7_L008_R1_001_paired.fastq.gz"
read2_8="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part2-6_trimmomatic/trimmed_8/8_2F_fox_S7_L008_R2_001_paired.fastq.gz"

# sample 22
/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
    --outFilterMultimapNmax 3 \
    --outSAMunmapped Within KeepPairs \
    --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
    --readFilesCommand zcat \
    --readFilesIn $read1_22 $read2_22 \
    --genomeDir $genomeDir \
    --outFileNamePrefix "22_3H_both_S16_L008_mus.GRCm39.dna.ens107.STAR"
echo "sample 22 aligned"

# sample 8
/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
    --outFilterMultimapNmax 3 \
    --outSAMunmapped Within KeepPairs \
    --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
    --readFilesCommand zcat \
    --readFilesIn $read1_8 $read2_8 \
    --genomeDir $genomeDir \
    --outFileNamePrefix "8_2F_fox_S7_mus.GRCm39.dna.ens107.STAR.aligned"
echo "sample 8 aligned"