# RNA-seq_pipeline_processing

This program reads a large Fastq file line by line to perform several steps and obtain RNA-Sequencing (RNA-Seq) using shell scripting.

The Fastaq file used in this program is of sea anemones (Aiptasia pallida) under study for immune response and symbiosis, with a total of 24 anemones divided into four treatment groups and six replicates per treatment group.

The first step in Aiptasia genome sequencing is using the GMAP database for the alignment process, which is optimized for fast alignment. The program creates a directory called AiptasiaGmapDb to store the sequence.

To align reads across introns and not within them, the program builds an intron and index using the GFF3 file.

Information regarding the output filed, including errors and logs, can be found in the STDERR and STDLOG files.

RNA-Seq reads are quality trimmed using the Trimmomatic trimmer, which is a Java-based quality trimmer. The program stores only files that end with R1.fastq and R2.fastq and creates two paired and unpaired directories to store the valid information.

To get trimmed files as output, the file path gets minus by files name, ultimately giving the exact R1.fastq and R2.fastq files, which are stored in the paired directory and can be used for alignment.
Reads are aligned using the parameter tool named sam, which stores align file data and processes ahead for sorting the file.

Once the alignments are done, the program can use the sam file for sorting and indexing the data. The sam file is used as an input file that takes data and gives bam format data using bamtool, and data is stored in the bam directory.

To index the file data, the program uses the samtools index command.
The implementation of trimming in RNA-Seq analysis workflows warrants caution and needs to be used in conjunction with a minimum read length filter to mitigate the introduction of unpredictable changes in expression estimate.


Reference:


      https://northeastern.instructure.com/courses/89605/pages/binf6308-module-6-practice-2?module_item_id=6541647

      https://onesearch.library.northeastern.edu/primo-explore/fulldisplay?docid=TN_cdi_pubmedcentral_primary_oai_pubmedcentral_nih_gov_4766705&context=PC&vid=NU&lang=en_US&search_scope=default_scope&adaptor=primo_central_multiple_fe&tab=default_tab&query=any,contains,Trimmomatic%20rna&offset=0
