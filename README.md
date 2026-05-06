# A life history traits categorizing framework to facilitate broad scale implementation of the Ne500 indicator using DNA data

This repository contains the scripts and associated workflow described in the publication [Harribey et al. *in prep.*](*LINK TO ADD*)

## Paper abstract

*abstract*

## Construction of the categorization framework

Starting from the LHT plan described in different studies among which [Capdevila et al. 2021](https://doi.org/10.1111/1365-2435.13604), we tested the robustness of the species coordinates and thus of trait correlations to principal axes. 
This resulted into nine categories combining different range of LHT that constitute the basis of a species categorizing framework. 

*in prep.*

## Workflow and scripts

The workflow includes different steps hereafter (scripts [here](https://github.com/mgharribey/LegacyGeneticNe/blob/main/scripts))
This part of the workflow has been implemented as an automatic pipeline into the [Galaxy-Ecology platform](LINK TO ADD). It contains the following steps:

### 1. Filtering of SNP data

Filtering steps were applied to SNP datasets in [VCF format](https://samtools.github.io/hts-specs/VCFv4.5.pdf) to homogeneise and ensure the quality of data and to apply current recommendations regarding genetic estimates of Ne ([Hemstrom et al. 2024](https://doi.org/10.1038/s41576-024-00738-6); [Waples 2024](https://doi.org/10.1111/1755-0998.13879)). 

Filtering was performed with [bcftools](https://doi.org/10.1093/gigascience/giab008) with thresholds upon genotype quality, read depth, missing data across SNP and individuals or heterozygosity.

[Command lines used](https://mgharribey.github.io/LegacyGeneticNe/docs/SNP_filtering_on_full_files.html) also include an automatization for several datasets. 


### 2. Calculation of genetic EBV (Essential Biodiversity Variables) 

First, the process of delimitation of populations in the legacy datasets is available here for [SSR](https://mgharribey.github.io/LegacyGeneticNe/docs/SSR_checking_microsat_files.html) and [SNP](https://mgharribey.github.io/LegacyGeneticNe/docs/SNP_Filt_pop_assignation_transfo_VCF_Genind.html) data
(not included in the Galaxy-Ecology workflow). 

You can find the codes to compute:
- Genetic summary statistics for [SSR data](https://mgharribey.github.io/LegacyGeneticNe/docs/Calculate_summary_statistics_SSR.html) and [SNP data](https://mgharribey.github.io/LegacyGeneticNe/docs/Calculate_summary_statistics_SNP.html), with a parallelization process in R, reducing computation time
- [Population-specific Fst with the Bayescan software](https://mgharribey.github.io/LegacyGeneticNe/docs/code_for_bayescan_prep_and_results.html) and summarize the results
- Estimates of [isolation-by-distance](https://mgharribey.github.io/LegacyGeneticNe/docs/IBD_calculation.html) using the [Rousset (1997) approach](https://doi.org/10.1093/genetics/145.4.1219)


### 3. Estimations of contemporary Ne

Estimation of effective population size using NeLD in NeEstimator (Do et al. 2014) in different populations across datasets has been implemented in an [automatic way for SSR](https://mgharribey.github.io/LegacyGeneticNe/docs/NeEstims_withNeLD_SSR.html), using [RLDNe R package](https://github.com/zakrobinson/RLDNe). 

The same [pipeline adpated for SNP](https://mgharribey.github.io/LegacyGeneticNe/docs/NeEstims_withNeLD_SNP.html) also includes the creation of replicates subsetting the number of loci when their number is sufficient and a correction for pseudoreplication ([Waples et al. 2016](https://doi.org/10.1038/hdy.2016.60)). 

We also used two other software to compare the estimation of Ne with NeLD: [Estim for SSR](https://doi.org/10.1046/j.1471-8278.2001.00086.x) and [ONeSAMP 3.0 for SNPs](https://doi.org/10.1093/g3journal/jkae153) (not included in the Galaxy-Ecology workflow). 

You may find [scripts reencoding SNP data for ONeSAMP 3.0](https://mgharribey.github.io/LegacyGeneticNe/docs/NeEstims_withONeSAMP3.html) useful. 


## Scripts to plot the results as shown in the publication

Codes to reproduce figures from the article can be found below, using genetic EBV and NeLD estimates from Table S7. 

*in prep.*


## Data statement

All datasets used for this study are published data, you can find datasets references and their original repositories in Table S4. 

Data have been reformatted and converted into both SNP and SSR specific formats for analyses.


## Sources

- Capdevila, Pol, Maria Beger, Simone P. Blomberg, Bernat Hereu, Cristina Linares, et Roberto Salguero-Gómez. 2020. « Longevity, Body Dimension and Reproductive Mode Drive Differences in Aquatic versus Terrestrial Life-History Strategies ». Functional Ecology 34 (8): 1613‑25. https://doi.org/10.1111/1365-2435.13604.

- Danecek, Petr, Adam Auton, Goncalo Abecasis, et al. 2011. « The variant call format and VCFtools ». Bioinformatics 27 (15): 2156‑58. https://doi.org/10.1093/bioinformatics/btr330.

- Danecek, Petr, James K. Bonfield, Jennifer Liddle, et al. 2021. « Twelve years of SAMtools and BCFtools ». GigaScience 10 (2): giab008. https://doi.org/10.1093/gigascience/giab008.

- Do, C., R. S. Waples, D. Peel, G. M. Macbeth, B. J. Tillett, et J. R. Ovenden. 2014. « NEESTIMATOR v2: Re‐implementation of Software for the Estimation of Contemporary Effective Population Size ( N  e  ) from Genetic Data ». Molecular Ecology Resources 14 (1): 209‑14. https://doi.org/10.1111/1755-0998.12157.

- Foll, Matthieu, et Oscar Gaggiotti. 2008. « A Genome-Scan Method to Identify Selected Loci Appropriate for Both Dominant and Codominant Markers: A Bayesian Perspective ». Genetics 180 (2): 977‑93. https://doi.org/10.1534/genetics.108.092221.

- Hemstrom, William, Jared A. Grummer, Gordon Luikart, et Mark R. Christie. 2024. « Next-Generation Data Filtering in the Genomics Era ». Nature Reviews Genetics, juin 14, 1‑18. https://doi.org/10.1038/s41576-024-00738-6.

- Hong, Aaron, Rebecca G. Cheek, Suhashi Nihara De Silva, et al. 2024. « ONeSAMP 3.0: Estimation of Effective Population Size via SNP Data from One Population ». G3 Genes|Genomes|Genetics, juillet 12, jkae153. https://doi.org/10.1093/g3journal/jkae153.

- Robinson, Zak. (2019) 2025. zakrobinson/RLDNe. https://github.com/zakrobinson/RLDNe.

- Rousset, François. 1997. « Genetic Differentiation and Estimation of Gene Flow from F -Statistics Under Isolation by Distance ». Genetics 145 (4): 1219‑28. https://doi.org/10.1093/genetics/145.4.1219.

- Vitalis, R., et D. Couvet. 2001. « Estim 1.0: A Computer Program to Infer Population Parameters from One- and Two-Locus Gene Identity Probabilities ». Molecular Ecology Notes 1 (4): 354‑56. https://doi.org/10.1046/j.1471-8278.2001.00086.x.

- Waples, Robin S. 2024. « Practical Application of the Linkage Disequilibrium Method for Estimating Contemporary Effective Population Size: A Review ». Molecular Ecology Resources 24 (1): e13879. https://doi.org/10.1111/1755-0998.13879.

- Waples, R. K., W. A. Larson, et R. S. Waples. 2016. « Estimating Contemporary Effective Population Size in Non-Model Species Using Linkage Disequilibrium across Thousands of Loci ». Heredity 117 (4): 4. https://doi.org/10.1038/hdy.2016.60.

- Waples, Robin S., et Chi Do. 2008. « Ldne: A Program for Estimating Effective Population Size from Data on Linkage Disequilibrium ». Molecular Ecology Resources 8 (4): 753‑56. https://doi.org/10.1111/j.1755-0998.2007.02061.x.

