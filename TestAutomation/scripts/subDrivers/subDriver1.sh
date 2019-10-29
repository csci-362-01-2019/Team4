#!/bin/bash


#NOT NEEDED IF RAN FROM MAIN SCRIPT!!!!!
# Going to the root file!
#echo $PWD
#cd ..
#echo $PWD
#cd ..
#echo $PWD

# Compiling the Java file!
cd ./testCasesExecutables/
javac -cp openmrs-api.jar: methodDriver1.java

#back to root
cd .. 

method="convertToInteger(Long longValue)" 


#Executing the Java file!
#This needs to do a loop through the testcases
#and see which ones it to test by method name


for file in ./testCases/*.txt; do
	temp=$(sed -n 3p $file)
	if [ "$temp" == "$method" ]
	then
		inputVariable=$(sed -n 4p $file)
    testID=$(sed -n 1p $file)
    
    cd ./testCasesExecutables/
		output=$(java -cp openmrs-api.jar: methodDriver1 $inputVariable)
    cd ..
    echo $output > ./temp/outputTest$testID.txt
    
  fi
done