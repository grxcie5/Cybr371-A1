#!/bin/bash 
#discussed proj code with following students
#Abigail Espejo 300526060
#Rosanne Saparamadu 300530238
#Mehma Siddiqui 300526379

echo "Enter patient's first name, last name and date of birth"
read -p "First Name: " firstName
read -p "Last Name: " lastName
read -p "Date of birth: " date

cd /opt/WellingtonClinic/patients/

#get the patients file name
firstLetter=${firstName:0:1}
lastLetter=${lastName: -1}
dob=${date///}
fileName="${firstLetter,,}${lastLetter,,}$dob"
#go into their file
cd $fileName

if [ -f "pbasicinfo.log" ]
then
  #checks if current doctor executing is in the registered patients file
  if grep -q $USER "pbasicinfo.log"
  then
    rFile="pmedicalrecord.log"
    read -r -p "Date of visit: " date
    read -r -p "Doctor: " doctor
    read -r -p "Health issue: " issue
    read -r -p "Medication: " med
    read -r -p "Dosage: " dosage
    echo "$date,$doctor,$issue,$med,$dosage" >> $rFile
  else 
    #user is not patients doctor
    echo "you are not a registered doc for this patient"
    pkill -f register-patient.sh
  fi
fi

