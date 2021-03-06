#!/usr/bin/env bash
set -eo pipefail

which bwa
which samtools

for i in {1945063..1945071}
do
    accession=SRR${i}
    bash map.sh ${accession}_1.fastq.gz ${accession}_2.fastq.gz 16 alignments/${accession}.bam > alignments/${accession}-map.log 2>&1
done
