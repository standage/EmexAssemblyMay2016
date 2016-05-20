#!/usr/bin/env bash
set -eo pipefail

which java
jar=$1

for i in {63..68};
do
    java -jar $jar HISTOGRAM_FILE=alignments/SRR19450${i}-hist.pdf INPUT=alignments/SRR19450${i}.bam OUTPUT=alignments/SRR19450${i}-metrics.txt &
done
java -jar $jar HISTOGRAM-WIDTH=5000 HISTOGRAM_FILE=alignments/SRR1945069-hist.pdf INPUT=alignments/SRR1945069.bam OUTPUT=alignments/SRR1945069-metrics.txt &
java -jar $jar HISTOGRAM-WIDTH=10000 HISTOGRAM_FILE=alignments/SRR1945070-hist.pdf INPUT=alignments/SRR1945070.bam OUTPUT=alignments/SRR1945070-metrics.txt &
java -jar $jar HISTOGRAM-WIDTH=15000 HISTOGRAM_FILE=alignments/SRR1945071-hist.pdf INPUT=alignments/SRR1945071.bam OUTPUT=alignments/SRR1945071-metrics.txt &

wait
