#!/bin/bash

#Removes report files from reports directory
rm -rf ./reports/*.txt
rm -rf ./reports/finalReport.html

#################################
#Compile all "driver" Java files#
#################################

cd testCasesExecutables
javac -cp openmrs-api.jar: ./*.java
cd ..


###############################################################
#Read in each test case, run them, add results to final report#
###############################################################

#Initialize case number to ensure test cases are run in order
caseNum=0

for file in testCases/*.txt; do	

	#Increment case number
	caseNum=$((caseNum+1))

	#Read in each line from testCase.txt
	testID=$(sed -n '1p' ./testCases/testCase$caseNum.txt)	
  	class=$(sed -n '2p' ./testCases/testCase$caseNum.txt)
	method=$(sed -n '3p' ./testCases/testCase$caseNum.txt)
	input=$(sed -n '4p' ./testCases/testCase$caseNum.txt)	
	oracle=$(sed -n '5p' ./testCases/testCase$caseNum.txt)
	driver=$(sed -n '6p' ./testCases/testCase$caseNum.txt)
  	requirement=$(sed -n '7p' ./testCases/testCase$caseNum.txt)

	#Find output of method using the input and the specified driver
	cd testCasesExecutables
	output=$(java -cp openmrs-api.jar: $driver $input)
	cd ..

	#Compare output to oracle to get result (pass/fail)
	result="Fail"
	if [ "$output" == "$oracle" ]
	then
		result="Pass"
	fi

	#Append the individual test case information to the final report
	echo -e "<tr><td> $testID </td><td> $class </td><td> $method </td><td> $requirement </td><td> $input </td><td> $output </td><td> $oracle </td><td> $result </td></tr>" >> ./reports/finalReport.txt

done


################################
#Produce/open final report html#
################################

cat ./docs/finalReportTempP1.html > ./reports/finalReport.html
cat ./reports/finalReport.txt >> ./reports/finalReport.html

firefox ./reports/finalReport.html&




