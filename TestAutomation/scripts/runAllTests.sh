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
  oracle=$(cat $file)
  
  result="Fail"
  if [ "$realOut" == "$oracle" ]
  then
  	result="Pass"
  fi
  
  echo -e "<pre>Test $count\tInput: $realIn\tOracle: $oracle\tResult: $result</pre>" >> ./reports/finalReport.txt
  
done
