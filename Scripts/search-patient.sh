#!/bin/bash
#discussed proj code with following students
#Abigail Espejo 300526060
#Rosanne Saparamadu 300530238
#Mehma Siddiqui 300526379

read -p "Doctors full name or username: " doctor
cd ..
cd staff/doctors

for d in */; do
  #if given name is a user name
  if [[ ${d::-1} == $doctor ]] 
  then
    cd ${d}
    if [ -f "sbasicinfo.log" ]
    then
      str=$(cat sbasicinfo.log)
      IFS=','
      read -a infoArr<<<"$str"
      #store doctors full name and user name
      doctorFullName=${infoArr[0]}
      doctorUsername="$doctor"
      break
    fi  
  else
  #given name is full name 
    cd ${d}
    if [ -f "sbasicinfo.log" ]
    then
      #if doctors name is found in sbasicinfo.log of a doctor
      if grep -q $doctor "sbasicinfo.log"
      then
        str=$(cat sbasicinfo.log)
        IFS=','
        #store file in an array
        read -a infoArr<<<"$str" 
        IFS=' '
        n=${infoArr[0]}
        #store name in an array
        read -a name<<<"$n"
        firstName=${name[0]}
        lastName=${name[1]}
        firstTwo=${firstName:0:2}
        lastTwo=${lastName:0:2}
        #store doctors full name and user name
        doctorFullName=$name
        doctorUsername="${firstTwo,,}${lastTwo,,}${infoArr[2]}"
        break
      fi
    fi
  fi
cd ..
done
cd ../../../
cd patients
lp=()
for d in */; do 
  cd ${d}
  if [ -f "pbasicinfo.log" ]
  then
    #if the doctors username is in the patients basic info file
    if grep -q $doctorUsername "pbasicinfo.log"
    then
      patientFile=$(cat pbasicinfo.log)
      IFS=','
      read -a patientInfo<<<"$patientFile"
      patientFN=${patientInfo[0]}
      patientLN=${patientInfo[1]}
      patient="$patientFN $patientLN"
      lp+=($patient)
    fi
  fi
cd ..
done
printf "Doctor\n"
printf "$doctorFullName ($doctorUsername)\n"
printf "Patients\n"
if [ ${#lp[@]} -eq 0 ]
then
  echo "No patients found for $doctorName ($username)"
else
  echo ${lp[@]}
fi


