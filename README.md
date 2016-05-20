The published *Eufriesea mexicana* genome assembly is embarrassing.
The only information they provided was that they used SOAPdenovo.
This is me unable to contain my curiosity: is this a tough genome, or was the assembly just *that bad*?


## Pre-processing

Software prerequisites
- java
- trimmomatic
- bwa
- samtools 1.3
- picard tools
- fastqc

```bash
# Data retrieval
./download-genome.sh
./download-reads.sh

# QC: before trimming
fastqc --threads 18 SRR19450??_?.fastq.gz
mkdir -p qc/before-trimming/
mv *_fastqc*html *_fastqc*zip qc/before-trimming/

# Adapter and quality trimming
./run-trim.sh /usr/local/src/Trimmomatic-0.33/trimmomatic-0.33.jar

# QC: after trimming
fastqc --threads 18 SRR19450??-trim_?.fq.gz
mkdir -p qc/after-trimming/
mv *_fastqc*html *_fastqc*zip qc/after-trimming/

# Three-pass digital normalization
./diginorm.sh
```
