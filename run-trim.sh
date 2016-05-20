#!/usr/bin/env bash
set -eo pipefail

which java

for i in {1945063..1945071}
do
    accession=SRR${i}
    bash trim.sh /usr/local/src/NGS-DIR/TRIMMOMATIC/Trimmomatic-0.33/trimmomatic-0.33.jar adapters.fa ${accession} 32 > ${accession}-trim.log 2>&1
done
