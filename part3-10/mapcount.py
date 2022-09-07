#!/usr/bin/env python

# script overview: takes a sam file and parses bitwise flags to count number of reads mapped and unmapped 

import argparse
def get_args():
    parser = argparse.ArgumentParser(description="A program to count mapped and unmapped reads from .sam file.")
    parser.add_argument("-f", "--samFile", help="Please specify .sam filename", required=True, type = str)
    return parser.parse_args()

args = get_args()

mappedCount = 0
notMapped = 0

with open(args.samFile, "r") as rawSamFile:
    for line in rawSamFile:
        if not line.startswith("@"):
            header = line.split("\t")
            flag = int(header[1])

            if ((flag & 256) != 256): #bitwise flag for secondary alignment
                if((flag & 4) != 4): 
                    mappedCount += 1
                else:
                    if((flag & 4) == 4):
                        notMapped += 1

#with open(f"mapCount_{args.samFile}.txt", "w") as mapCountfile:
#    mapCountfile.write(f"Number of reads properly mapped to reference genome: {mappedCount}\n")
#    mapCountfile.write(f"Number of reads NOT mapped to genome: {notMapped}")

print(f"mappedCount:{mappedCount}\nnotMapped:{notMapped}")