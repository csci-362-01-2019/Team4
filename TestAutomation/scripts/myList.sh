#!/bin/bash
#lists top level (root directory) contents

cd ..
contents = ls -a

htmlTest= <!DOCTYPE html><html><body><h1>My First Heading</h1><p>$contents</p></body></html>



firefox $htmlTest