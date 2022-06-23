#!/bin/bash
#discussed proj code with following students
#Abigail Espejo 300526060
#Rosanne Saparamadu 300530238
#Mehma Siddiqui 300526379

read -p "Patients first name: " patientFN
read -p "Patients last name: " patientLN
read -p "Doctor name or username: " doctor
cd ../staff/doctors
#go through all the doctors
for d in */; do
  #if the given name for doctor isnt there (isnt a username)
  if [[ ${d::-1} != $doctor ]]
  then
    cd ${d}
    if [ -f "sbasicinfo.log" ]
    then
      #if sbasicinfo.log has the doctors name
      if grep -q "$doctor" "sbasicinfo.log"
      then
      #create the username out of the information in doctors sbasicinfo.log
      str=$(cat sbasicinfo.log)
      IFS=','
      read -a infoArr<<<"$str"
      name=${infoArr[0]}
      IFS=' '
      read -a nArr<<<"$name"
      first=${nArr[0]}
      last=${nArr[1]}
      firstTwo=${first:0:2}
      lastTwo=${last:0:2}
      doctorName="${firstTwo,,}${lastTwo,,}${infoArr[2]}"
      fi
    fi
    cd ..
  else
    doctorName="$doctor"
 fi
done

cd ../../patients
#get the first bit of the username if patient was a doctor
firstTwo=${patientFN:0:2}
lastTwo=${patientLN:0:2}
compareName="${firstTwo,,}${lastTwo,,}"
#if the patients doctor username and the doctors username are the same
#terminate the program
if [[ "$doctorName" == *"$compareName"* ]]
then
  echo "Denied: a patient cannot be their own doctor"
  pkill -f assign-doc.sh
fi
#for all the patients
for d in */; do
  cd ${d}
  if [ -f "pbasicinfo.log" ]
  then
    pName="${patientFN},${patientLN}"
    #if the patient name is found in a pbasicinfo.log (found patient)
    if grep -q "${pName}" "pbasicinfo.log"
    then
      str=$(cat pbasicinfo.log)
      #if the pbasicinfo.log doesnt already contain the doctors name
      if [[ "$str" != *"$doctorName"* ]]
      then
        #echo the doctors name onto the end of pbasicinfo.log
        echo "$str,$doctorName" > pbasicinfo.log
      fi
      break
    fi
  fi
  cd ..
done

