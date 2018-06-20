#!/bin/sh

#
# creates new release for aar lib
# usage
#   upgrade <new version> <input aar path>
#
#

[ $# != 2  ]                            && echo "usage: upgrade <version> <input file>" && exit 1
[ ! -d  "MELROSE_GROUP" ]               && echo "Run from the same directory, not from `pwd`..." && exit 1
[ -d MELROSE_GROUP/soj-artifact/$1 ]    && echo "that revision already exists..." && ls -la MELROSE_GROUP/soj-artifact/$1  && exit 1
[ ! -e $2 ]                             && echo "file cannot be found \"$2\" " && exit 1

 mvn install:install-file -DgroupId=MELROSE_GROUP    \
     -DartifactId=soj-artifact -Dversion="$1"        \
     -Dfile="$2" -Dpackaging=aar -DgeneratePom=true  \
     -DlocalRepositoryPath=.  -DcreateChecksum=true




     