#!/bin/bash
#SBATCH -J script_Bayescan_Fst_few_SNPs
#SBATCH -o script_Bayescan_Fst_few_SNPs.out
#SBATCH -e script_Bayescan_Fst_few_SNPs.out
#SBATCH --cpus-per-task=5 
#SBATCH --mem=8G
#SBATCH --mem-per-CPU=25G

module purge
module load statistics/R/4.2.2
module load bioinfo/BayeScan/2.1



#keep the default values

srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Alytes_obstetricans_Barratt_2024_subset_1.txt" -fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Alytes_obstetricans_Barratt_2024_subset_2.txt" -fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Alytes_obstetricans_Barratt_2024_subset_3.txt" -fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Alytes_obstetricans_Barratt_2024_subset_4.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Alytes_obstetricans_Barratt_2024_subset_5.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Barbastella_barbastellus_Razgour_2024_subset_1.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Barbastella_barbastellus_Razgour_2024_subset_2.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Barbastella_barbastellus_Razgour_2024_subset_3.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Barbastella_barbastellus_Razgour_2024_subset_4.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Barbastella_barbastellus_Razgour_2024_subset_5.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Coenagrion_mercuriale_Leveque_2024_full_few_snps.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Cypripedium_calceolus_Gargiulo_2023_subset_1.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Cypripedium_calceolus_Gargiulo_2023_subset_2.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Cypripedium_calceolus_Gargiulo_2023_subset_3.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Cypripedium_calceolus_Gargiulo_2023_subset_4.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Cypripedium_calceolus_Gargiulo_2023_subset_5.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Fagus_sylvatica_Milesi_2024_subset_1.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Fagus_sylvatica_Milesi_2024_subset_2.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Fagus_sylvatica_Milesi_2024_subset_3.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Fagus_sylvatica_Milesi_2024_subset_4.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Fagus_sylvatica_Milesi_2024_subset_5.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Passer_domesticus_Hagen_2020_subset_1.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Passer_domesticus_Hagen_2020_subset_2.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Passer_domesticus_Hagen_2020_subset_3.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Passer_domesticus_Hagen_2020_subset_4.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Passer_domesticus_Hagen_2020_subset_5.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Pinus_pinaster_Milesi_2024_subset_1.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Pinus_pinaster_Milesi_2024_subset_2.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Pinus_pinaster_Milesi_2024_subset_3.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Pinus_pinaster_Milesi_2024_subset_4.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Pinus_pinaster_Milesi_2024_subset_5.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Pinus_sylvestris_Milesi_2024_subset_1.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Pinus_sylvestris_Milesi_2024_subset_2.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Pinus_sylvestris_Milesi_2024_subset_3.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Pinus_sylvestris_Milesi_2024_subset_4.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Pinus_sylvestris_Milesi_2024_subset_5.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Raja_clavata_Marandel_2020_subset_1.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Raja_clavata_Marandel_2020_subset_2.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Raja_clavata_Marandel_2020_subset_3.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Raja_clavata_Marandel_2020_subset_4.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Raja_clavata_Marandel_2020_subset_5.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Sardina_pilchardus_Antoniou_2023_subset_1.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Sardina_pilchardus_Antoniou_2023_subset_2.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Sardina_pilchardus_Antoniou_2023_subset_3.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Sardina_pilchardus_Antoniou_2023_subset_4.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Sardina_pilchardus_Antoniou_2023_subset_5.txt"-fstat -od "snps_results/"
srun -N 1 -n 1 --exclusive BayeScan -threads $SLURM_CPUS_PER_TASK "snps_files/gen_Ursus_arctos_Kopatz_2024_full_few_snps.txt"-fstat -od "snps_results/"

wait