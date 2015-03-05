#!/bin/sh

FILE=$1

if [ -z "$1" ]
then
    echo "Please enter an already-existing code snippet as first param"
    exit 1
fi

NEWNAME=$2

if [ -z "$2" ]
then
    echo "Please enter new CodeSnippet title as second param"
    exit 1
fi

SNIPPET_NAME="${FILE%%.*}"
SNIPPET_NAME=$(echo $SNIPPET_NAME | sed 's/-/\\-/g')
sed -i.bak "s/$SNIPPET_NAME/$2/" $1
mv $1 $2.codesnippet
rm $1.bak
