#!/bin/bash

#Removes all txt files in oracles/temp/reports directories
rm -rf ./oracles/*.txt
rm -rf ./temp/*.txt
rm -rf ./reports/*.txt
rm -rf ./reports/finalReport.html

#################################
#Compile all "driver" Java files#
#################################

cd testCasesExecutables
javac -cp openmrs-api.jar: ./*.java
cd ..


#####################################
#Read in each test case and run them#
#####################################

#Initialize test case counter
caseCounter=0

for file in testCases/*.txt; do	

	#Read in the testID, input, and driver info from testCase.txt
	testID=$(sed -n '1p' $file)
	input=$(sed -n '4p' $file)
	driver=$(sed -n '6p' $file)

	#Pipe oracle into oracle txt	
	sed -n '5p' $file > ./oracles/testOracle$testID.txt

	#Pipe output from driver into txt
	cd testCasesExecutables
	output=$(java -cp openmrs-api.jar: $driver $input)
	cd ..
	echo $output > ./temp/outputTest$testID.txt

	#Increment test case counter
	caseCounter=$((caseCounter+1))

done


##########################################################
#Compare oracles to driver outputs, form final report txt#
##########################################################

for case in $( seq $caseCounter ); do

	#Read in the output and oracle for test case to be compared
	output=$(cat ./temp/outputTest$case.txt)
  oracle=$(cat ./oracles/testOracle$case.txt)

	#Compare output to oracle to get result (pass/fail)
	result="Fail"
	if [ "$output" == "$oracle" ]
	then
		result="Pass"
	fi

	#Read in other basic info from test case
  method=$(sed -n '3p' ./testCases/testCase$case.txt)
  class=$(sed -n '2p' ./testCases/testCase$case.txt)
  requirement=$(sed -n '7p' ./testCases/testCase$case.txt)
	input=$(sed -n '4p' ./testCases/testCase$case.txt)
	  
	#Append the individual test case report to the final report
	echo -e "<tr><td> $case </td><td> $class </td><td> $method </td><td> $requirement </td><td> $input </td><td> $output </td><td> $oracle </td><td> $result </td></tr>" >> ./reports/finalReport.txt
	  
done


################################
#Produce/open final report html#
################################

cat ./docs/finalReportTempP1.html > ./reports/finalReport.html
cat ./reports/finalReport.txt >> ./reports/finalReport.html
#cat ./docs/finalReportTempP3.html >> ./reports/finalReport.html

firefox ./reports/finalReport.html&




