#!/usr/bin/bash 

DIR=~/Reports/
if [ -d ${DIR} ]
then
        echo "${DIR} is exists"
else
        mkdir ${DIR}
fi


cd ${DIR}
mkdir Backups
for F in {1..12}
do
 if [ -f $(date +%Y)-${F}-$(date +%d).xls ]
then
        echo "file is exists" 
else
        echo "this is report" > $(date +%Y)-${F}-$(date +%d).xls
fi
done


if [ $(date +%I) - lt 5 ] || [ $(date +%I) -eq 12 ] && [ $(date +%p) == "AM" ]
then


for F in {1..12}
do
tar -czf $(date +%Y)-${F}-$(date +%d).xls.tar.gz $(date +%Y)-${F}-$(date +%d).xls
 mv  $(date +%Y)-${F}-$(date +%d).xls.tar.gz ~/Reports/Backups
done

echo "backup is done and save at ~/Reports/Backups"
else
     echo " You can not backup now...backup start from 12AM to 5AM "
fi


exit
