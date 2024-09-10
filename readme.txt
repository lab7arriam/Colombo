Colombo v4.0 with Sigi-HMM v1.0 and Sigi-CRF v1.0 for 
Prediction of Genomic Islands in Procaryotic Genomes 
-------------------------------------------------------------------------------------

WHAT IS COLOMBO?
COLOMBO is a software framework equipped with a GUI for the statistical
analysis of sequences of a genome. It can be supplied with different plugins 
that actually perform the analysis. The current version comes with Sigi-HMM
and SIGI-CRF, tools for the prediction of Genomic Islands. SIGI-HMM has been
demonstrated during the ECCB 2006. It's planned to continue extending Colombo 
further with more plugins for various other applications in the future.


INSTALLING COLOMBO
To install Colombo, just copy the directory Colombo anywhere you like. You will
also need a working version of the Java Virtual Machine. Colombo assumes that
a Sun Java interpreter is installed and accessible by the command "java". 
If you don't have java in your path, or the Java runtime environment has a
different name on your system, in the file Colombo replace "java" by the 
command you want to invoke the JRE with. In this case, you might also adapt 
the command line parameters to the needs of your Java distribution.


RUNNING COLOMBO
Colombo has been compiled and tested thoroughly under version 1.5.0 of the 
Sun Java interpreter.  

To run Colombo from a unix platform, just type 
./Colombo 
from within the directory "Colombo". (You will need to set the file system execute 
permission first by using 'chmod +x Colombo' (or similar) on that file, if not
already done)

To run Colombo from a windows platform, just type
Colombo.bat
from within the directory "Colombo"


CREATING POSTSCRIPT FILES
The feature of creating an ps-file from a gff-file out of the user interface
is currently not available because of problems with the Java Runtime Environment. 
The execution of scripts with large inputs or outputs does not work properly.
The next version of the Java Runtime Environment will hopefully fix this 
problem. Instead it is recommended to produce the ps-output by using gff2ps with 
the included options-file in an UNIX environment. All required files are located 
in the directory external/gff2ps. You can produce a gff2ps output by issuing the 
command

./run-gff2ps <gff-output> [-T <title> -t <subtitle>]

where title and subtitle are optional. It is also possible to pass
more gff2ps command-line parameters to the script, or change the
settings in the COLOMBO-specific options file (with the name
./external/gff2ps/colombo-gff2ps.rc). See the gff2ps manual for details.
Note that running gff2ps is only possible on UNIX systems.


FILES AND PATHS
At present, Colombo accepts files in the formats EMBL, GenBank and FASTA as input 
source for the evalated genomes. Besides GFF output, it will also produce EMBL or 
GenBank output files that are enriched by the GI information as misc_feature. 
Enter the paths to the corresponding files into the input lines.

In the Settings menu for SIGI-HMM plugin, you will be asked for a path to a list 
of Codon Usage Tables presented in a *.cut file. Each such file contains a number 
of Codon Usages serving as a model for possible donors. A Codon Usage is specified 
with a description, followed by a newline and 64 nonnegative numbers, interpreted 
as Codon occurrences. The order of Codons is the following:
CGA CGC CGG CGU AGA AGG CUA CUC CUG CUU UUA UUG UCA UCC UCG UCU 
AGC AGU ACA ACC ACG ACU CCA CCC CCG CCU GCA GCC GCG GCU GGA GGC 
GGG GGU GUA GUC GUG GUU AAA AAG AAC AAU CAA CAG CAC CAU GAA GAG 
GAC GAU UAC UAU UGC UGU UUC UUU AUA AUC AUU AUG UGG UAA UAG UGA
The default file is external/cut/default.cut

For the SIGI-CRF plugin a similar references file with tetramere counts is used.

If you like to run the genome viewer Artemis from within Colombo, you can
specify the corresponding path in the Paths dialog of the Settings menu.


RESULTS AND STATES
Colombo uses the following keywords to represent gene-classes:
    NORMAL = Normal/Native gene.
    PUTAL  = Putative alien gene. Possible donors are available in the advanced
	     classification table.
    INCON  = Normal/native gene within an island. Those are referred to as 
	     inconspicious genes.
Colombo/SIGI-HMM makes use of an additional outlier-test. If a gene is rated as being an
outlier, the prefix "OUT" is added to the keyword, resulting in:
    OUTNORMAL
    OUTPUTAL


INCLUDING CUSTOM DONORS
You might want to include custom donor candidates in Colombo/SIGI-HMM's prediction.
The Donors-Dialog for the SIGI-HMM plugin enables you to add those from an EMBL-File. 
You may save the resulting CUT-File somewhere else and include it through the 
Paths-Dialog as described above.


OPTIONS
The plugins option of the Settings menu is for the later integration of
additional models. At present there are 3 plugins: two different versions
of SigiHMM (SigiHMM and mSigiHMM) and SIGI-CRF as a third. Both versions of the 
SIGI-HMM plugin should produce equivalent output, but might have different running 
times: the latter appeared to be faster in the majority of cases.


BATCH PROCESSING
There are also standalone commandline versions of the plugins for 
automated script-guided runnings. They can be invoked with
one of the commands:

  ./SigiHMM [options]
  ./mSigiHMM [options]
  ./SigiCRF [options]

or (Windows):

  SigiHMM.bat [options]
  mSigiHMM [options]
  SigiCRF [options]

also from within the directory Colombo. To see a list of available options and 
their default values, use "help" as option.

(On Unix you will need to set the file system execute permissions first, if not
already done)


NOTE ON MEMORY SETTING / LIMITATION
The scripts to run Colombo (Colombo on Unix, Colombo.bat on Windows) are shell 
scripts that call the Java runtime executable with the main class. Please note 
the parameter -Xmx<size> in these scripts, you may want to change 
this parameter if you run Colombo with unusual files and parameters. 
The parameter controls how much RAM the program may use. The standard 
recommendation is -Xmx1400m for max. 1400 MB of RAM. 
For most usage scenarios this setting is already more than needed. If you don't 
encounter any memory problems, then there's no benefit in changing this setting.  
More memory is only needed for large genomes and high values of MRL parameter.
Please note that on 32 bit windows you cannot use significantly more memory due to a 
Java runtime limitation, while 64 bit platforms can allow much higher memory usage. 


If any problems arise, feel free to contact:

Corresponding author (all tools and scientific papers):
Prof. Dr. Stephan Waack, waack@cs.uni-goettingen.de

Author of SIGI-CRF and updated Colombo implementation:
Achim Stindt

Authors of SIGI-HMM and initial Colombo release:
Dr. Thomas Brodag
Dr. Oliver Keller