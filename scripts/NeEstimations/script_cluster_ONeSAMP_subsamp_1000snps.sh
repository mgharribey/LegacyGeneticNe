#!/bin/bash
#SBATCH -J script_snps_ONeSAMP
#SBATCH -o script_snps_ONeSAMP.out
#SBATCH -e script_snps_ONeSAMP.out 
#SBATCH --mem=10G
#SBATCH --nodes=2
#SBATCH --ntasks=32
#SBATCH --cpus-per-task=1

module load devel/python/Python-3.6.3
module load statistics/R/3.4.3

for i in $(cat list_snps_files.txt); do 

	python main.py --o subsamp_1000snps/${i} \
    --m 0.000001 \
    --s 50000 \
		--lNe 5 --uNe 10000 \
    --lT 0.00005 --uT 0.05 &> results_subsamp_1000snps/${i%.txt}_output.txt
done