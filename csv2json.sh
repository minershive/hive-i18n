#!/usr/bin/env bash
# Convert all CSVs to {key: value, ...} JSON files

cd `dirname $0`

for fname in *.csv; do

	jname=`basename -s .csv $fname`.json

    echo "Converting $fname to $jname"


	{
	echo '{'
    cat $fname |
        sed '/^$/d' | #delete empty linex
        sed 's/","/": "/g' | #key: value
        sed 's/$/,/g' |  #coma
        sed '$ s/,$//' # delete last coma
    echo '}'
    } | jq . > $jname

done


