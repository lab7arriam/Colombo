clear
#java -cp .;.\libs\biojava.jar;.\libs\bytecode-0.92.jar;.\libs\commons-cli.jar;.\libs\commons-collections-2.1.jar;.\libs\commons-dbcp-1.1.jar;.\libs\commons-pool-1.1.jar -Xms256m -Xmx1400m SigiHMM %* > error.log
java -cp .;.\libs\biojava.jar;.\libs\bytecode.jar;.\libs\commons-math -Xms256m -Xmx1400m SigiHMM %* > error.log

 