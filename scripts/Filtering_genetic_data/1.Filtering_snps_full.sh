!/bin/bash


# Same filtering code 

##########################################################
######## VARIABLES SET-UP for filtering THRESHOLDS########
##########################################################
##### Should be the only place to modify things


MIN_DP=6
MIN_GQ=20
#MEAN_DP depends on the vcf 

MAX_MISSING_IND=0.2
MAX_MISSING_SNP=0.2

MAC=2


echo "Set-up parameters"
echo $MIN_DP
echo $MIN_GQ

echo $MAX_MISSING_IND
echo $MAX_MISSING_SNP

echo $MAC

##########################################################
#STEP 1: Preparation
##########################################################


###### A : prepare the folders
name_of_filtering_threshold="MIN_DP_${MIN_DP}_MD_SNPs_${MAX_MISSING_SNP}_Ind_${MAX_MISSING_IND}"
if [ ! -f "filtered_data/${name_of_filtering_threshold}_full_vcf/" ]; then

	mkdir filtered_data/${name_of_filtering_threshold}_full_vcf
	mkdir filtered_data/${name_of_filtering_threshold}_full_vcf/geno_qual
	mkdir filtered_data/${name_of_filtering_threshold}_full_vcf/MD_SNPs
	mkdir filtered_data/${name_of_filtering_threshold}_full_vcf/FINAL

	mkdir filtered_data/${name_of_filtering_threshold}_full_vcf/graphics
	mkdir filtered_data/${name_of_filtering_threshold}_full_vcf/graphics/before_MD_filtering
	mkdir filtered_data/${name_of_filtering_threshold}_full_vcf/graphics/after_MD_filtering

	mkdir filtered_data/${name_of_filtering_threshold}_full_vcf/intermed_files
	mkdir filtered_data/${name_of_filtering_threshold}_full_vcf/intermed_files/indlist
fi

path="filtered_data/${name_of_filtering_threshold}_full_vcf"

###### B : Find the unfiltered vcf files
find raw_data/snps/ -type f -name "*.vcf" > list_raw_snps_files_full
find filtered_data/${name_of_filtering_threshold}_full_vcf/FINAL/ -type f -name "*.vcf" > $path/list_filtered_snps_files_full

comm -3 <(sed 's|^raw_data/snps/||' list_raw_snps_files_full | sort) <(sed "s|^filtered_data/${name_of_filtering_threshold}_full_vcf/FINAL/||" $path/list_filtered_snps_files_full | sort) > $path/list_snps_files_full_to_filter


echo "Number of files to filter"
cat $path/list_snps_files_full_to_filter | wc -l


###################################################################
#STEP 2: Filter for missing data and read depth
####################################################################

# Creation of a tab to get the summary info about the filtering
output_stats=$path/vcftools_filter_summary.csv
if [ ! -f "$output_stats" ]; then
	echo "SNP or Ind,Filename,Before filtering,After qual filt,After SNPs missingness,After SNPs and ind missingness,Remark" > $output_stats
fi


#A loop that does all the actions in one time
for i in $(cat $path/list_snps_files_full_to_filter); do


	####################################################################
	#STEP 1: filtering on quality= on min RD and GQ and on twice mean RD
	####################################################################
	
	#input vcf
	input_file="raw_data/snps/${i}"
	#output vcf
	output_file="$path/geno_qual/${i%.vcf}.vcf"
	
	remark=""
	remark1=""
	remark2=""
	
	if [ ! -f "$output_file" ]; then
		#for the min RD by genotype and for twice the mean RD by genotype
		mean_RD=$(awk -v i="${i%.vcf}" '$1 == i {print $4}' "mean_RD_raw_vcf_full.txt")
		mean_RD=$(echo "$mean_RD" | awk '{print $1+0}')
		
		if grep -q "##FORMAT=<ID=DP" "${input_file}"; then
			bcftools filter -S . -e "FMT/DP<${MIN_DP} | FMT/DP>=${mean_RD}" -O z -o "$output_file" "$input_file"
			
		elif grep -q -e "##INFO=<ID=DP" "${input_file}"; then
			bcftools filter -S . -e "INFO/DP<${MIN_DP} | INFO/DP>=${mean_RD}" -O z -o "$output_file" "$input_file"
		else
			remark1="no data on read depth"
		fi
	
		
		if grep -q "##INFO=<ID=GQ" "${output_file}"; then
			temp_vcf="${output_file%.vcf}_tmp.vcf"
			bcftools filter -S . -e "INFO/GQ<${MIN_GQ}" -O z -o "$temp_vcf" "$output_file"
			
			mv "${temp_vcf}" "${output_file}"
		elif grep -q "##FORMAT=<ID=GQ" "${output_file}"; then
			temp_vcf="${output_file%.vcf}_tmp.vcf"
			bcftools filter -S . -e "FMT/GQ<${MIN_GQ}" -O z -o "$temp_vcf" "$output_file"
			
			mv "${temp_vcf}" "${output_file}"
		else
			remark2="no data on GQ"
		fi
		
		remark="${remark1} ${remark2}"
		if [ -n "$remark" ]; then 
			cp ${input_file} $path/geno_qual/
			#keeping the original vcf
			echo "No filtering on geno qual"
		fi
		
	else 
		echo "${i} already filtered for data quality"
	fi
	
	#checking
	ind_before=$(bcftools query -l ${input_file} | wc -l)
	snps_before=$(bcftools view -H ${input_file} | wc -l)
	
	ind_filt_qual=$(bcftools query -l ${output_file} | wc -l)
	snps_filt_qual=$(bcftools view -H ${output_file} | wc -l)
  
	#to be used to plot the missingness of SNPs and ind
	Intermed_file="$path/intermed_files/${i%.vcf}_geno_qual"
	if [ ! -f "${Intermed_file}.imiss" ]; then
		vcftools --vcf $output_file --missing-indv --out $Intermed_file
		vcftools --vcf $output_file --missing-site --out $Intermed_file
	fi
  
	####################################################################
	#STEP 2: Remove SNPs with a high amount of missing data and singletons
	####################################################################
	
	#input vcf
	input_file="$path/geno_qual/${i%.vcf}.vcf"
	#output vcf
	output_file="$path/MD_SNPs/${i%.vcf}.vcf"

	if [ ! -f "$output_file" ]; then

		bcftools filter -e "F_MISSING > ${MAX_MISSING_SNP} | MAC<${MAC}" -O z -o "$output_file" "$input_file"

	fi
	
	#checking
	ind_MD_SNPs=$(bcftools query -l ${output_file} | wc -l)
	snps_MD_SNPs=$(bcftools view -H ${output_file} | wc -l)
	
	####################################################################
	#STEP 3: Remove inds with a high amount of missing data
	####################################################################
	
	#input vcf
	input_file="$path/MD_SNPs/${i%.vcf}.vcf"
	#output vcf
	output_file="$path/FINAL/${i%.vcf}.vcf"

	if [ ! -f "$output_file" ]; then
		Intermed_files="$path/intermed_files/${i%.vcf}_MD_SNPs"

		vcftools --vcf $input_file --missing-indv --out $Intermed_files
    
		imiss="$path/intermed_files/${i%.vcf}_MD_SNPs.imiss"

		ind_miss="$path/intermed_files/indlist/${i%.vcf}_ind_missing_SNPs.txt"

		awk -v threshold="$MAX_MISSING_IND" 'NR > 1 && $5 < threshold { print $1 }' "$imiss" > $ind_miss

		bcftools view -S $ind_miss -O z -o "$output_file" "$input_file"
	fi
	
	#checking
	Intermed_file="$path/intermed_files/${i%.vcf}_MD_snps_ind"
	if [ ! -f "${Intermed_file}.frq" ]; then
		vcftools --vcf $output_file --freq2 --out $Intermed_file #info about MAF
		vcftools --vcf $output_file --counts --out $Intermed_file #info about MAC
	fi
	
	ind_MD_SNPs_ind=$(bcftools query -l ${output_file} | wc -l)
	snps_MD_SNPs_ind=$(bcftools view -H ${output_file} | wc -l)
	
	
	echo "IND,${i},$ind_before,$ind_filt_qual,$ind_MD_SNPs,$ind_MD_SNPs_ind,$remark" >> $output_stats
	echo "SNPs,${i},$snps_before,$snps_filt_qual,$snps_MD_SNPs,$snps_MD_SNPs_ind" >> $output_stats

done

echo "Filtering done."
echo "Look at the vcftools_filter_summary.csv"
echo "But also at the R script to visualize missingness before filtering and the MAF profile after filtering"
