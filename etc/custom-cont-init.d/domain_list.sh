#!/bin/sh

## writes a json file with list of all effective domains

file=/config/www/domains.json
echo "[" > $file
shopt -s nocasematch
if [[ "$ONLY_SUBDOMAINS" != "True" ]] 
then
echo "  [ \"https://$URL\" ]," >> $file
fi
IFS=',' read -ra ADDR <<< `echo $SUBDOMAINS`
for i in "${ADDR[@]}" ; do echo "  [ \"https://$i.$URL\" ]," >> $file ; done
if [[ "$EXTRA_DOMAINS" =~ "." ]]
then
IFS=',' read -ra ADDR <<< `echo $EXTRA_DOMAINS`
for i in "${ADDR[@]}"; do echo "  [ \"https://$i\" ]," >> $file ; done
fi
echo "[ \"dummyEntry\" ] ]" >> $file

