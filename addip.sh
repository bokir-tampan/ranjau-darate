#!/bin/bash
#ambil data

wget -q -O /root/ipsc/ip "https://raw.githubusercontent.com/bokir-tampan/test/main/ip"
echo "Input IP"
read  -e -p "insert Name:" id
read -e -p "(ip ):" user
CLIENT_EXISTS=$(grep -w $user /root/ipsc/ip | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo ""
echo "vps sudah terdaftar."
exit 1
fi
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "### $id $exp $user" >> /root/ipsc/ip
cd /root/ipsc
git config --global user.email "moving.headers@gmail.com" &> /dev/null
git config --global user.name "bokir-tampan" &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
git add . &> /dev/null
git commit -m m &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/bokir-tampan/test.git
git push -f https://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@github.com/bokir-tampan/test.git &> /dev/null
clear
rm -f /root/ipsc/ip
echo "Done"
echo "Your IP Has Been Registered"
echo -e "==============================="
echo "IP         : $user"
echo "Expired ON : $exp"
echo -e "==============================="
