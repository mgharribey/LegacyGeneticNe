# Construction of the 3D - categorization LHT framework

This repository contains the main scripts and associated workflows from the publication Harribey et al. *in prep.*(*LINK TO ADD*):

***Mapping effective population size across a three-dimensional life-history framework of species and populations to support broad-scale Ne500 indicator implementation***
 
$\small\mathsf{\text{by Marie-Gabrielle Harribey, Joachim Mergeay, Anja Westram, Laura Martínez Antón, Xiatong Cai, Julia Geue, Frédéric Raspail, Peter Galbusera,}$ 
$\small\mathsf{\text{Sean Hoban, Alexander Kopatz, Linda Laikre, Gernot Segelbacher, Cristiano Vernesi, Christina Hvilsom, Joost Raeymaekers , Myriam Heuertz, }}$
$\small\mathsf{\text{Pauline Garnier-Géré}}$


Starting from the life-history traits (LHT) variation plane described in previous multivariate analyses of demographic life tables (among which Capdevila et al. 2021, and see COMPADRE/COMADRE Databases, Salguero-Gómez et al. 2015, 2016), we tested the robustness of the species coordinates and thus of trait correlations across the first 2 principal axes: the **Fast-slow continuum** strongly correlated to generation time or age at sexual maturity and the **Reproductive strategies** continuum strongly correlated to the spread of reproduction throughout lifespan and the mean reproductive output. 

We proposed nine categories across those 2 axes for different range of LHTs variation, which, combined with a third axis including **population-specific differentiation within species**, constitutes the basis of our **species by population 3D categorizing framework**. 

## Testing the robustness of species attribution to LHTs first 2 axes 

Main related analyses can be found [here](https://mgharribey.github.io/LegacyGeneticNe/docs/Implementation_LHT_framework.html).

## Genetic analyses workflows for mapping across the third axis of the framework

The workflows includes different steps hereafter (scripts [here](https://github.com/mgharribey/LegacyGeneticNe/blob/main/scripts)).
This part of the workflow has been implemented as automatic pipelines into the [Galaxy-Ecology platform](https://usegalaxy.eu/workflows/list_published?owner=ginamo), described by Martínez Antón et al. *in prep.*(*LINK TO ADD*). It contains the following steps:

### 1. SNP data filtering

Filtering steps were applied to SNP datasets in VCF format (Danecek et al. 2011) to homogenise and ensure data quality and to apply current recommendations regarding genetic estimates of Ne (Hemstrom et al. 2024; Waples 2024).
Filtering was performed with bcftools (Danecek et al. 2021) with thresholds upon genotype quality, read depth, missing data across SNP and individuals or heterozygosity.

[Command lines used](https://mgharribey.github.io/LegacyGeneticNe/docs/SNP_filtering_on_full_files.html) also include an automatization for several datasets. 


### 2. Calculation of genetic EBV (Essential Biodiversity Variables) 

NB: The initial step of delimiting populations in legacy datasets is explained in the material and methods and supplementary material of the publication, and scripts are available here for [SSR](https://mgharribey.github.io/LegacyGeneticNe/docs/SSR_checking_microsat_files.html) and [SNP](https://mgharribey.github.io/LegacyGeneticNe/docs/SNP_Filt_pop_assignation_transfo_VCF_Genind.html) data. Since the delimitation of population has been tailored to each Legacy dataset included, this part has not been automatized in the Galaxy-Ecology workflow, which however include [decision-making tools for helping to delimit populations](*LINK TO ADD*). 

You can also find the codes to compute:
- Genetic summary statistics for [SSR data](https://mgharribey.github.io/LegacyGeneticNe/docs/Calculate_summary_statistics_SSR.html) and [SNP data](https://mgharribey.github.io/LegacyGeneticNe/docs/Calculate_summary_statistics_SNP.html), with a parallelization process in R, reducing computation time
- [Population-specific Fst with the Bayescan software](https://mgharribey.github.io/LegacyGeneticNe/docs/code_for_bayescan_prep_and_results.html) and summarize the results
- Estimates of [isolation-by-distance](https://mgharribey.github.io/LegacyGeneticNe/docs/IBD_calculation.html) using the Rousset (1997) approach (script not included in the Galaxy-Ecology workflow)


### 3. Estimations of contemporary Ne

Estimation of effective population size using NeLD in NeEstimator (Do et al. 2014) in different populations across datasets has been implemented in an [automatic way for SSR](https://mgharribey.github.io/LegacyGeneticNe/docs/NeEstims_withNeLD_SSR.html), using the RLDNe R package (Robinson 2019). 

The same [pipeline adapted for SNP](https://mgharribey.github.io/LegacyGeneticNe/docs/NeEstims_withNeLD_SNP.html) also includes a) the creation of replicates subsetting the number of loci to decrease computer time when their number is sufficient (Waples 2024) and a correction for pseudoreplication following recommendations by Waples et al. (2016). 

We also used two other methods to compute genetic Ne estimates when data allow it, and to compare them with NeLD estimates: Estim for SSR and ONeSAMP 3.0 for SNPs (not included in the Galaxy-Ecology workflow). You may find [scripts used for running ONeSAMP 3.0](https://mgharribey.github.io/LegacyGeneticNe/docs/NeEstims_withONeSAMP3.html) useful. They include a reencoding SNP datasets.


## Scripts to plot the results as shown in the publication

Codes to reproduce the main figures from the article can be found [here](https://mgharribey.github.io/LegacyGeneticNe/docs/Figures_analyses_legacy_datasets_paper.html), using genetic EBV and NeLD estimates from Table S7. 



## Data statement

All datasets used for this study are published data, you can find their references and original repositories in Table S4. 
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

- Salguero-Gómez, R., Jones, O. R., Archer, C. R., Bein, C., de Buhr, H., Farack, C., Gottschalk, F., Hartmann, A., Henning, A., Hoppe, G., Römer, G., Ruoff, T., Sommer, V., Wille, J., Voigt, J., Zeh, S., Vieregg, D., Buckley, Y. M., Che-Castaldo, J., … Vaupel, J. W. (2016). COMADRE: A global data base of animal demography. Journal of Animal Ecology, 85(2), 371–384. https://doi.org/10.1111/1365-2656.12482

- Salguero-Gómez, R., Jones, O. R., Archer, C. R., Buckley, Y. M., Che-Castaldo, J., Caswell, H., Hodgson, D., Scheuerlein, A., Conde, D. A., Brinks, E., de Buhr, H., Farack, C., Gottschalk, F., Hartmann, A., Henning, A., Hoppe, G., Römer, G., Runge, J., Ruoff, T., … Vaupel, J. W. (2015). The compadre Plant Matrix Database: An open online repository for plant demography. Journal of Ecology, 103(1), 202–218. https://doi.org/10.1111/1365-2745.12334

- Vitalis, R., et D. Couvet. 2001. « Estim 1.0: A Computer Program to Infer Population Parameters from One- and Two-Locus Gene Identity Probabilities ». Molecular Ecology Notes 1 (4): 354‑56. https://doi.org/10.1046/j.1471-8278.2001.00086.x.

- Waples, Robin S. 2024. « Practical Application of the Linkage Disequilibrium Method for Estimating Contemporary Effective Population Size: A Review ». Molecular Ecology Resources 24 (1): e13879. https://doi.org/10.1111/1755-0998.13879.

- Waples, R. K., W. A. Larson, et R. S. Waples. 2016. « Estimating Contemporary Effective Population Size in Non-Model Species Using Linkage Disequilibrium across Thousands of Loci ». Heredity 117 (4): 4. https://doi.org/10.1038/hdy.2016.60.

- Waples, Robin S., et Chi Do. 2008. « Ldne: A Program for Estimating Effective Population Size from Data on Linkage Disequilibrium ». Molecular Ecology Resources 8 (4): 753‑56. https://doi.org/10.1111/j.1755-0998.2007.02061.x.

