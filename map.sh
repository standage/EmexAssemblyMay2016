#!/usr/bin/env bash
set -eo pipefail

one=$1
two=$2
threads=$3
out=$4

bwa mem -t $threads Emex.gdna.long.fa $one $two \
    | samtools view -bS - \
    | samtools sort -m 10G -o $out -@ $threads -O BAM
