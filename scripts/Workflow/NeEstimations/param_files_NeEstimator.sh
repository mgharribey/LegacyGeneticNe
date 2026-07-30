#!/bin/bash


####################################################################
##### SET UP #######
####################################################################

####Number of SNPs to subsampled
NB=1000



####List of filtered files 
#already done
#path_filtered_vcfs="../Summary_stats_genetic/Genetic_data_v2/filtered_data/MIN_DP_6_MD_SNPS_0.2_Ind_0.2/FINAL/"
#find $path_filtered_vcfs -type f -name "*.vcf" > list_snps_files_by_pop.txt
#sed -i "s|^$path_filtered_vcfs||" list_snps_files_by_pop.txt

find genpop_files/snps_full -type f > list_snps_files_by_pop.txt
sed -i "s|^genpop_files/snps_full/||" list_snps_files_by_pop.txt

####################################################################
##### write the param files to automatize the launching of NeEstimator
####################################################################

# These param files will be read in R by RLDNe package

for i in $(cat list_snps_files_by_pop.txt); do 

  if [ ! -f "with_NeEstimator/Param_files/subsamp_${NB}snps/${i%.vcf}_${NB}snps_subset_5.txt" ]; then #check if has already been done
    for j in {1..5}; do
    #With 5 replicates
    
    genpop_file="genpop_files/subsamp_${NB}snps/${i%.vcf}_${NB}snps_subset_${j}.gen"
    
	output_file="with_NeEstimator/Results/subsamp_${NB}snps/${i%.vcf}_${NB}snps_subset_${j}.txt"
      param_file="with_NeEstimator/Param_files/subsamp_${NB}snps/${i%.vcf}_${NB}snps_subset_${j}.txt"

      cp with_NeEstimator/Param_files/Ne_params_basis.txt "$param_file"
      sed -i "10s|.*|${output_file}|" "$param_file"
      sed -i "11s|.*|${genpop_file}|" "$param_file"
    
    done
  else
    echo "chek if has already been done in with_NeEstimator/Param_files/subsamp_${NB}snps/ folder"
  fi


### full dataset
  if [ ! -f "with_NeEstimator/Param_files/snps_full/${i%.vcf}.txt" ]; then #check if has already been done
    
	genpop_file="genpop_files/snps_full/${i%.vcf}.gen"
	output_file="with_NeEstimator/Results/snps_full/${i%.vcf}.txt"
	param_file="with_NeEstimator/Param_files/snps_full/${i%.vcf}.txt"

      cp with_NeEstimator/Param_files/Ne_params_basis.txt "$param_file"
      sed -i "10s|.*|${output_file}|" "$param_file"
      sed -i "11s|.*|${genpop_file}|" "$param_file"

  else
    echo "chek if has already been done in with_NeEstimator/Param_files/snps_full/ folder"
  fi

done


# For full vcf - because some don't have 1000 SNPs to subsampling
for i in $(cat list_snps_files_by_pop.txt); do
	genpop_file="genpop_files/snps_full/${i}"
	output_file="with_NeEstimator/Results/snps_full/${i%.gen}.txt"
	param_file="with_NeEstimator/Param_files/snps_full/${i%.gen}.txt"

      cp with_NeEstimator/Param_files/Ne_params_basis.txt "$param_file"
      sed -i "10s|.*|${output_file}|" "$param_file"
      sed -i "11s|.*|${genpop_file}|" "$param_file"
done

# add the loop for microsat files


####List of filtered files 
#path_microsat="genpop_files/microsat/"
#find $path_microsat > list_microsat_files_by_pop.txt
#sed -i "s|^$path_microsat||" list_microsat_files_by_pop.txt


for i in $(cat list_microsat_files_by_pop.txt); do 

  if [ ! -f "with_NeEstimator/Param_files/microsat/${i}" ]; then #check if has already been done

    genepop_file="genpop_files/microsat/${i}"
    
	output_file="with_NeEstimator/Results/microsat/${i}"
    param_file="with_NeEstimator/Param_files/microsat/${i}"

      cp with_NeEstimator/Param_files/Ne_params_basis.txt "$param_file"
      sed -i "10s|.*|${output_file}|" "$param_file"
      sed -i "11s|.*|${genepop_file}|" "$param_file"
    
  else
    echo "chek if has already been done in with_NeEstimator/Param_files/microsat/ folder"
  fi

done


for i in $(cat list_microsat_files_by_pop.txt); do 


    genepop_file="genpop_files/microsat/${i}"
    
	output_file="with_NeEstimator/Results/microsat/${i}"
    param_file="with_NeEstimator/Param_files/microsat/${i}"

      cp with_NeEstimator/Param_files/Ne_params_basis.txt "$param_file"
      sed -i "10s|.*|${output_file}|" "$param_file"
      sed -i "11s|.*|${genepop_file}|" "$param_file"
    


done
