#!/bin/bash


####################################################################
##### SET UP #######
####################################################################

mkdir bayescan_files/microsat
mkdir bayescan_files/snps


####List of filtered files 
#already done
#path="genepop_files/snps/"
#find $path -type f -name "*.txt" > list_snps_files.txt
#sed -i "s|^$path||" list_snps_files.txt

#already done
#path="genepop_files/microsat/"
#find $path -type f -name "*.txt" > list_microsat_files.txt
#sed -i "s|^$path||" list_microsat_files.txt


####################################################################
##### convert genpop into with PGDspider pilot
####################################################################

# Genpop format is needed to run BAYESCAN

### SNPs
for i in $(cat list_snps_files.txt); do 

  if [ ! -f ""bayescan_files/snps/bayescan_${i}"" ]; then #check if has already been done

    genpop_files="genepop_files/snps/${i}"
	bayescan_files="bayescan_files/snps/bayescan_${i}"
    
    java -Xmx1024m -jar PGDSpider2-cli.jar -inputfile $genpop_files -inputformat GENEPOP -outputfile $bayescan_files -outputformat GESTE_BAYE_SCAN -spid genepop_2bayescan.spid

  else
    echo "chek if has already been done in bayescan_files/snps/${i} folder"
  fi
  
done

##### 1000 SNPs corrected (obtained from .Rmd file)
#### To launch in your local terminal
for i in $(cat list_symphonia_files.txt); do 

    genpop_files="genepop_files/1000snps_corrected/${i}"
	bayescan_files="bayescan_files/1000snps_corrected/bayescan_${i}"
    
    java -Xmx1024m -jar PGDSpider2-cli.jar -inputfile $genpop_files -inputformat GENEPOP -outputfile $bayescan_files -outputformat GESTE_BAYE_SCAN -spid genepop_2bayescan.spid

done


### microsat
for i in $(cat list_microsat_files.txt); do 

  if [ ! -f "bayescan_files/microsat/bayescan_${i}" ]; then #check if has already been done

    genpop_files="genepop_files/microsat/${i}"
	bayescan_files="bayescan_files/microsat/bayescan_${i}"
    
    java -Xmx1024m -jar PGDSpider2-cli.jar -inputfile $genpop_files -inputformat GENEPOP -outputfile $bayescan_files -outputformat GESTE_BAYE_SCAN -spid genepop_2bayescan.spid

  else
    echo "chek if has already been done in bayescan_files/snps/${i} folder"
  fi


for i in $(cat list_microsat_files.txt); do
	genpop_files="genepop_files/microsat/${i}"
	bayescan_files="bayescan_files/microsat/bayescan_${i}"
	java -Xmx1024m -jar PGDSpider2-cli.jar -inputfile $genpop_files -inputformat GENEPOP -outputfile $bayescan_files -outputformat GESTE_BAYE_SCAN -spid genepop_2bayescan_microsat.spid 
done