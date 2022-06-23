#!/bin/bash
#discussed proj code with following students
#Abigail Espejo 300526060
#Rosanne Saparamadu 300530238
#Mehma Siddiqui 300526379

cd ..
cd patients

for d in */; do
  cd ${d}
  input="pmedicalrecord.log"
  while IFS= read -r line
  do
  IFS=','
  read -a linearr<<<"$line"
  docName=${linearr[1]}
  med=${linearr[3]}
  echo "Doctor ${docName} issued medication ${med}"
  done < "$input"
  cd ..
done

