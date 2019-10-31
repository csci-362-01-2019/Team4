#!/bin/bash

# Compiling the Java file!
cd ./testCasesExecutables/
javac -cp openmrs-api.jar: methodDriver2.java

#back to root
cd .. 

driver="subDriver2" 


#Executing the Java file!
#This needs to do a loop through the testcases
#and see which ones it to test by method name


for file in ./testCases/*.txt; do
	temp=$(sed -n 6p $file)
	if [ "$temp" == "$driver" ]
	then
		inputVariable=$(sed -n 4p $file)
    		testID=$(sed -n 1p $file)
    
    	cd ./testCasesExecutables/
		output=$(java -cp openmrs-api.jar: methodDriver2 $inputVariable)
    	cd ..
    	echo $output > ./temp/outputTest$testID.txt
    
  fi
done
