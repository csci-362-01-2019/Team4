#!/bin/bash

#Compile all "driver" Java files
javac -cp ./project/openmrs-api.jar: ./testCasesExecutables/*.java

#Read in each test case and run them
for file in ./testCases/*.txt; do

	#Read in input, testID, and driver info from testCase.txt
	testID=$(sed -n '1p' $file)
	input=$(sed -n '4p' $file)
	driver=$(sed -n '6p' $file)

	#Pipe output from driver into txt
	java -cp ./project/openmrs-api.jar: ./testCasesExecutables/$driver $input >./temp/outputTest$testID.txt

done
