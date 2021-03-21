#! /bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --job-name=star
#SBATCH --mem=60G

source ~/.bash_profile^C
spack load /ndj6yar star@2.7.0e%gcc@6.3.0 arch=linux-centos7-x86_64

j=1
for i in {57..59};do
file1=/athena/angsd/scratch/yuc4009/NRG1/SRR114706${i}_1.fastq.gz;
file2=/athena/angsd/scratch/yuc4009/NRG1/SRR114706${i}_2.fastq.gz;

STAR --runMode alignReads --runThreadN 8 --genomeDir /athena/angsd/scratch/yuc4009/refdata/star_index --readFilesIn $file1 $file2 --outFileNamePrefix DMSO_${j}. --readFilesCommand zcat --outSAMtype BAM SortedByCoordinate;

let j+=1;
done
