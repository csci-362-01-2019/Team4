#!/bin/bash


for file in testCases/*.txt; do	
	TESTID=$(sed -n '1p' $file)
	sed -n '1p' $file > ./oracles/testCaseOracle$TESTID.txt
done

#./scripts/subDrivers/subDriver1.sh
#./scripts/subDrivers/subDriver2.sh
#./scripts/subDrivers/subDriver3.sh

