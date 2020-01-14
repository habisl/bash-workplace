#! /bin/bash
file=$1
if [ -e $file ]
then
	echo -e "File $file exists"
else
	echo -e "File $file doesnt exists"
fi


# example usage
# $ ./exist.sh /usr/bin/boot.ini
# File /usr/bin/boot.ini exists
