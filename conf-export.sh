#!/bin/sh
mvn scalate:conf-export -Dconfluence.user=$1 -Dconfluence.password=$2
#echo "================================="
#echo "Deleting user's manual"
#rm -Rf src/main/webapp/index/documentation/karaf-users*
echo "================================="
echo "Fixing images links"
for i in `find src/main/webapp/ | grep -v \.svn`
do
	if [[ -f $i ]]
	then
		echo $i
		perl -i -p -e 's/\!([^\/]*\.png|[^\/]*\.gif)/\!\/images\/\1/' $i
	fi
done
echo "================================="
echo "Done"
echo "================================="

