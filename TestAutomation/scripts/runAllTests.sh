#!/bin/bash

#removes all files
rm -rf ./oracles/*
rm -rf ./temp/*
rm -rf ./reports/*
echo "..." > ./temp/DummyText
echo "..." > ./oracles/DummyText
echo "..." > ./reports/DummyText


#getting the oracles from file
for file in testCases/*.txt; do	
	TESTID=$(sed -n '1p' $file)
	sed -n '5p' $file > ./oracles/testOracle$TESTID.txt
done

#running subdrivers (getting I/O results)
for file in scripts/subDrivers/*.sh; do
	./$file
done

#Compares oracles to results
count=0
for file in oracles/*.txt; do
	count=$((count+1))
  realOut=$(cat ./temp/outputTest$count.txt)
  realIn=$(sed -n '4p' ./testCases/testCase$count.txt)
  oracle=$(cat ./oracles/testOracle$count.txt)
  method=$(sed -n '3p' ./testCases/testCase$count.txt)
  class=$(sed -n '2p' ./testCases/testCase$count.txt)
  requirement=$(sed -n '7p' ./testCases/testCase$count.txt)
  
  result="Fail"
  if [ "$realOut" == "$oracle" ]
  then
  	result="Pass"
  fi
  
  echo -e "<pre>Test $count\nClass: $class\nMethod: $method\nRequirement: $requirement\nInput: $realIn\nOracle: $oracle\nResult: $result\n</pre>" >> ./reports/finalReport.txt
  
  
done

cat ./docs/finalReportTempP1.txt > ./reports/finalReport.html
cat ./reports/finalReport.txt >> ./reports/finalReport.html
cat ./docs/finalReportTempP3.txt >> ./reports/finalReport.html



firefox ./reports/finalReport.html&
