# 16S rRNA Studies of Vaginal Microbiome #


### Aim ###

* To study 16S- rRNA vaginal samples of Human Microbiome
* Version 1.0

### Prerequisites ###

* [Mothur](http://www.mothur.org/)
* [Phyloseq](https://joey711.github.io/phyloseq/)
* [DESeq2](http://www.bioconductor.org/packages/release/bioc/html/DESeq2.html)
* [ape](http://cran.r-project.org/web/packages/ape/index.html)
* [ggplot2](http://cran.r-project.org/web/packages/ggplot2/index.html)

### Run Scripts ###

* Make.OTU_sh is the shell script for running mothur pripeline. Make sure it is in the same directory as your unzipped fastq data and modify the shell script according to the data in hand 
 	
	* To run the mothur script for your data
	
	*./mothur Make_OTU.sh*
		
* Phyloseq.R is an R script to perform set of experiments on a biom file 
* To run the script
	
	*make -f Makefile*


