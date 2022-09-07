#!/bin/bash

#SBATCH --partition=bgmp            ### Partition
#SBATCH --job-name=htseq%j          ### Job Name
#SBATCH --output=htseq%j.out        ### File in which to store job output
#SBATCH --error=htseq%j.err         ### File in which to store job error messages
#SBATCH --nodes=1                   ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=1         ### Number of tasks to be launched per Node
#SBATCH --cpus-per-task=4           ### Number of cpus per node
#SBATCH --account=bgmp              ### Account used for job submission

#usage: htseq-count [-h] [--version] [-f {sam,bam,auto}] [-r {pos,name}] [--max-reads-in-buffer MAX_BUFFER_SIZE] [-s {yes,no,reverse}]
#                   [-a MINAQUAL] [-t FEATURE_TYPE] [-i IDATTR] [--additional-attr ADDITIONAL_ATTRIBUTES] [--add-chromosome-info]
#                   [-m {union,intersection-strict,intersection-nonempty}] [--nonunique {none,all,fraction,random}]
#                   [--secondary-alignments {score,ignore}] [--supplementary-alignments {score,ignore}] [-o SAMOUTS] [-p {SAM,BAM,sam,bam}]
#                   [-d OUTPUT_DELIMITER] [-c OUTPUT_FILENAME] [--counts-output-sparse] [--append-output] [-n NPROCESSES]
#                   [--feature-query FEATURE_QUERY] [-q] [--with-header]
#                   samfilenames [samfilenames ...] featuresfilename

sam_22="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part3-9_star/Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a/22_3H_both_S16_L008_mus.GRCm39.dna.ens107.STAR.Aligned.out.sam"
sam_8="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part3-9_star/Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a/8_2F_fox_S7_mus.GRCm39.dna.ens107.STAR.Aligned.out.sam"
mus_gtf="/projects/bgmp/skim6/bioinfo/Bi622/QAA/part3-9_star/Mus_musculus.GRCm39.107.gtf"

conda activate QAA

# sample 22, yes
#/usr/bin/time -v htseq-count \
#    --stranded=yes \
#    $sam_22 $mus_gtf

# sample 22, reverse
#/usr/bin/time -v htseq-count --stranded=reverse $sam_22 $mus_gtf

# sample 8, yes
#/usr/bin/time -v htseq-count --stranded=yes $sam_8 $mus_gtf

# sample 8, reverse
#/usr/bin/time -v htseq-count --stranded=reverse $sam_8 $mus_gtf

# sample 22, stranded = no
/usr/bin/time -v htseq-count --stranded=no $sam_22 $mus_gtf

