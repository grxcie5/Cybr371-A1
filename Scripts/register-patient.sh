#!/bin/bash
#discussed proj code with following students
#Abigail Espejo 300526060
#Rosanne Saparamadu 300530238
#Mehma Siddiqui 300526379

echo "Enter the following information about the patient:"
read -p "First name: " first
read -p "Last name: " surname
read -p "Date of birth (dd/mm/yyyy): " dateOfBirth
read -p "Gender: " gender
read -p "Physical address: " addr
read -p "Email: " email
read -p "Phone number: " phone
IFS=,
read -p "Registered doctors (enter username sparated by comma (,)): " -a docs
cd ..
cd patients
#get the first bit of the username if patient was a doctor
firstTwo=${first:0:2}
lastTwo=${surname:0:2}
compareName="${firstTwo,,}${lastTwo,,}"

#go through all the registered doctors and check if the
#patients "doctor username" is in there - if it is terminate program
for i in "${docs[@]}"
do 
  iName=${i:0:4}
  if [ "$iName" == "$compareName" ]; then
    echo "Doctor cannot be their own patient."
    pkill -f register-patient.sh
 fi
done

#collect the first and last letter of patients name and their dob
#then cast to lowercase and create the filename out of them
start=${first:0:1}
end=${surname: -1}
dob=${dateOfBirth///}
fName="${start,,}${end,,}${dob}"

#make the directory and the pbasicinfo.log file inside of it
mkdir -p $fName
cd $fName
echo "$first","$surname",$dateOfBirth,"$gender","$addr","$email","$phone",${docs[@]} > pbasicinfo.log

#below code is an attempt to set doctor have perms for 
#this dir so doctor can write to pmedicalrecord
#for i in "${regDocs[@]}"
#do
#  sudo setfacl -m u:$i:rwx $fName
#done
#cd $fName 

