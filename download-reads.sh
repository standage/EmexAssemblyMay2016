#!/usr/bin/env bash
set -eo pipefail

which fastq-dump

# This doesn't actually work. :-(
# See https://github.com/ncbi/sra-tools/issues/32.
# echo '/repository/user/cache-disabled = "true"' > ~/.ncbi/user-settings.mkfg

mkdir -p sra-cache
cachedir=$(pwd)/sra-cache
echo "/repository/user/main/public/root = \"$cachedir\"" > ~/.ncbi/user-settings.mkfg

for num in {1945063..1945071}
do
    accession=SRR${num}
    fastq-dump --split-files --gzip --accession $accession
done
