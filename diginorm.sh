#!/usr/bin/env bash
set -eo pipefail

threads=32
k=21
c1=20
c2=10

diginormargs="--max-memory-usage=64e9 --ksize=$k --paired --gzip"
countargs="--ksize=$k --max-memory-usage=64e9 --threads=16"

for i in {63..71}
do
    accession=SRR19450${i}
    interleave-reads.py ${accession}-trim_1.fq.gz ${accession}-trim_2.fq.gz \
        | normalize-by-median.py $diginormargs --cutoff=$c1 --output=${accession}-dn1.fq.gz - \
        > ${accession}-diginorm1.log 2>&1 &
done
wait

for i in {63..71}
do
    accession=SRR19450${i}
    load-into-counting.py $countargs ${accession}.counts ${accession}-dn1.fq.gz \
        > ${accession}-load.log 2>&1 &
done
wait

for i in {63..71}
do
    accession=SRR19450${i}
    filter-abund.py --threads=$threads --cutoff=1 --output=- ${accession}.counts ${accession}-dn1.fq.gz \
        | extract-paired-reads.py --output-single=${accession}-se.fq --output-paired=- - \
        | normalize-by-median.py $diginormargs --cutoff=$c2 --output=${accession}-dn2.fq.gz - \
        > ${accession}-diginorm2.log 2>&1
done
