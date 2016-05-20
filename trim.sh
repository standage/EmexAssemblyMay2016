#!/usr/bin/env bash
set -eo pipefail

jar=$1
adapters=$2
accession=$3
threads=$4

java -jar $jar PE -threads $threads -phred33 \
     ${accession}_1.fastq.gz \
     ${accession}_2.fastq.gz \
     ${accession}-trim_1.fq.gz \
     ${accession}-trim-unpaired_1.fq.gz \
     ${accession}-trim_2.fq.gz \
     ${accession}-trim-unpaired_2.fq.gz \
     ILLUMINACLIP:${adapters}:2:40:15 \
     LEADING:3 \
     TRAILING:3 \
     SLIDINGWINDOW:5:20 \
     MINLEN:50
