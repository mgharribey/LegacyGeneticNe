#!/bin/bash
#SBATCH -J script_Bayescan_Fst
#SBATCH -o script_Bayescan_Fst.out
#SBATCH -e script_Bayescan_Fst.out


module load statistics/R/4.2.2
module load bioinfo/BayeScan/2.1



for i in $(cat list_microsat_files.txt); do 

  echo "${i}"

  bayescan_file="microsat_files/${i}"
    
  BayeScan -threads 2 "${bayescan_file}" -fstat > "${i%.txt}_bayescan.out"
    
done 

#keep the default values