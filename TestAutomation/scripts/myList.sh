#/bin/bash
#script lists contents of top-level directory
#Evan Tanner

cd ..
ls | cat > tempContents.txt
sed '/tempContents.txt/d' tempContents.txt > contents.txt
rm tempContents.txt

echo '<!DOCTYPE html><html><body><h1>Root Files Listed</h1><p>' > webHtml.html 
cat contents.txt >> webHtml.html
echo '</p></body></html>' >> webHtml.html

rm contents.txt
firefox webHtml.html
rm webHtml.html

