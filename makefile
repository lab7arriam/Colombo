#*****************************************************************************
#*  PROJECT:
#*   Colombo
#*
#*  MODULE:
#*   makefile
#*
#*  AUTHOR
#*   NAME		EMAIL
#*   Thomas Brodag	Thomas.Brodag@T-Online.de
#*
#******************************************************************************

JC = javac -classpath ".:./libs/biojava.jar:./libs/bytecode-0.92.jar:\
    ./libs/commons-cli.jar:./libs/commons-collections-2.1.jar:\
    ./libs/commons-dbcp-1.1.jar:./libs/commons-pool-1.1.jar" 
#-Xlint:unchecked 

all: colombo plugins batch

colombo : Colombo.class
	$(JC) Colombo.java

plugins : tbSigiHMMCore.class okSigiHMMCore.class okSigiHMMoptCore.class TetraHMMCore.class
	$(JC) plugins/tbSigiHMMCore/tbSigiHMMCore.java \
	      plugins/okSigiHMMCore/okSigiHMMCore.java \
	      plugins/okSigiHMMoptCore/okSigiHMMoptCore.java \
	      plugins/TetraHMMCore/TetraHMMCore.java

batch : SigiHMM.class okSigiHMM.class okSigiHMMopt.class

tbSigiHMMCore.class : plugins/tbSigiHMMCore/tbSigiHMMCore.java 
okSigiHMMCore.class : plugins/okSigiHMMCore/okSigiHMMCore.java 
okSigiHMMoptCore.class : plugins/okSigiHMMoptCore/okSigiHMMoptCore.java 
TetraHMMCore.class : plugins/TetraHMMCore/TetraHMMCore.java

SigiHMM.class : GenericBatch.java
okSigiHMM.class : GenericBatch.java
okSigiHMMopt.class : GenericBatch.java

%.class : %.java
	$(JC) $<
    
clean:
	rm -f *.embl
	rm -f *.class
	rm -f core/*.class
	rm -f gui/*.class
	rm -f io/*.class
	rm -f features/*.class
	rm -f -r plugins/*Core/*.class

	rm -f *~
	rm -f core/*~
	rm -f gui/*~
	rm -f io/*~
	rm -f features/*~
	rm -f -r plugins/*Core/*~
