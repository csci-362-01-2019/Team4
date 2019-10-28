#!/bin/bash

# Going to the root file!
cd ..
cd ..
# echo $PWD

VAR1="1"									
VAR2="/testCases/testCase$VAR1.txt"			
sed -n 3p .$VAR2


# Compiling the Java file!
cd ./testCasesExecutables/
javac -cp openmrs-api.jar: methodDriver1.java


#Executing the Java file!
#This needs to do a loop through the testcases
#and see which ones it to test by method name
inputVariable="0"
java -cp openmrs-api.jar: methodDriver1 $inputVariable


#Going back to the original directory
cd ..
cd ./scripts/subDrivers