#!/usr/bin/env bash
set -eo pipefail

which bwa
which wget

cd alignments
wget http://hymenopteragenome.org/beebase/sites/hymenopteragenome.org.beebase/files/data/consortium_data/Eufriesea_mexicana.v1.0.fa.gz
gunzip -c Eufriesea_mexicana.v1.0.fa.gz | ./select.py > Emex.gdna.long.fa
bwa index Emex.gdna.long.fa
