#!/usr/bin/env python
import gzip
import matplotlib.pyplot as plt 
import argparse

def get_args():
    parser = argparse.ArgumentParser(description="A program to plot read length distribution.")
    parser.add_argument("-r1", "--read1", help="Please specify read 1 input *fastq.gz filename", required=True, type = str)
    parser.add_argument("-r2", "--read2", help="Please specify read 2 input *fastq.gz filename.", required = True, type = str)
    parser.add_argument("-t", "--plotTitle", help="Please specify plot title.", required = True, type = str)
    parser.add_argument("-o", "--outputFilename", help="Please specify output plot filename.", required = True, type = str)    
    return parser.parse_args()

args = get_args()

read1Count = []
read2Count = []

with gzip.open(args.read1, "rt") as read1file:
    r1LineCount = 0
    for line in read1file:
        line = line.strip("\n")
        r1LineCount += 1
        if r1LineCount % 4 == 2:
            r1Readlen = 0
            for i in line:
                r1Readlen += 1
            read1Count.append(r1Readlen)

with gzip.open(args.read2, "rt") as read2file:
    r2LineCount = 0
    for line in read2file:
        line = line.strip("\n")
        r2LineCount += 1
        if r2LineCount % 4 == 2:
            r2Readlen = 0
            for i in line:
                r2Readlen += 1
            read2Count.append(r2Readlen)

plt.hist((read1Count, read2Count), label=("read1", "read2"))
plt.legend(loc='upper left')
plt.yscale('log')
plt.title(args.plotTitle + "Read Length Distributions")
plt.savefig(args.outputFilename)
