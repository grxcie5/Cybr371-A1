#!/bin/bash
#discussed proj code with following students
#Abigail Espejo 300526060
#Rosanne Saparamadu 300530238
#Mehma Siddiqui 300526379

read -p "Patient's first name: " firstName
read -p "Patient's last name: " lastName
cd ../staff/doctors

#add all doctors usernames to an array
doctors=()
for d in */; do
  doctorUser=${d::-1}
  doctors+=( $doctorUser )
done

cd ../../patients
for d in */; do
  cd ${d}
  if [ -f "pbasicinfo.log" ]
  then
    pInfo=$(cat pbasicinfo.log)
    IFS=','
    read -a infoArr<<<"$pInfo"
    patientFN=${infoArr[0]}
    patientLN=${infoArr[1]}
    patientDoctors=()
    #if the patients name is the same as the current pbasicinfo.log patient
    if [ "$firstName" == "$patientFN" ] && [ "$lastName" == "$patientLN" ]
    then
      for i in "${infoArr[@]}" 
      do
        for j in "${doctors[@]}"
        do
          #if there is a doctor in the patients info (doctor is assigned)
          if [ "$i" == "$j" ]
          then
          #add the doctor to the list of patients doctors
          patientDoctors+=( $j )
          fi
        done
      done
      break
    fi 
  fi
  cd ..
done

cd ../../staff/doctors
allDocs=()
for d in "${doctors[@]}"
  do
  cd "$d/"
  infoS=$(cat sbasicinfo.log)
  IFS=','
  read -a fnArr<<<"$infoS"
  doctor="${fnArr[0]}:$d"
  allDocs+=( $doctor)
  cd ..
done


printf "Patient\n"
printf "$firstName,$lastName\n"
printf "Doctors\n"
echo "${allDocs[@]}"

