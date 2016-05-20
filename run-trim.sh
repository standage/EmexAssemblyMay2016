#!/usr/bin/env bash
set -eo pipefail

which java
jar=$1

for i in {1945063..1945071}
do
    accession=SRR${i}
    bash trim.sh $jar adapters.fa ${accession} 32 > ${accession}-trim.log 2>&1
done
