#!/bin/bash

cd ../../

#setting the file-system permissions for groups
setfacl -m g:administrators:rwx file-system-setup.sh
setfacl -m g:doctors:--- file-system-setup.sh
setfacl -m g:nurses:--- file-system-setup.sh
setfacl -m g:receptionists:--- file-system-setup.sh

#setting WellingtonClinic permissions for groups
setfacl -d -R -m g:administrators:rwx WellingtonClinic
setfacl -R -m g:doctors:r-x WellingtonClinic
setfacl -R -m g:nurses:r-x WellingtonClinic
setfacl -R -m g:receptionists:r-x WellingtonClinic

cd WellingtonClinic

#set doctor permissions for script files
#do not need to set for visit.sh as permissions r-x recurse
#from scripts
setfacl -m g:doctors:--- scripts/staff-create.sh
setfacl -m g:doctors:--- scripts/acls.sh
setfacl -m g:doctors:--- scripts/register-patient.sh
setfacl -m g:doctors:--- scripts/assign-doc.sh
setfacl -m g:doctors:--- scripts/search-patient.sh
setfacl -m g:doctors:--- scripts/search-doctor.sh
setfacl -m g:doctors:--- scripts/assign-doc.sh
setfacl -m g:doctors:r-- scripts/check-medication.sh
setfacl -m g:doctors:r-- scripts/audit.sh

#set permissions for nurses in script files
#do not need to set for check-medication as permissions r-x recurse
#from scripts
setfacl -m g:nurses:--- scripts/staff-create.sh
setfacl -m g:nurses:--- scripts/acls.sh
setfacl -m g:nurses:--- scripts/register-patient.sh
setfacl -m g:nurses:--- scripts/assign-doc.sh
setfacl -m g:nurses:--- scripts/search-patient.sh
setfacl -m g:nurses:--- scripts/search-doctor.sh
setfacl -m g:nurses:--- scripts/visit.sh
setfacl -m g:nurses:--- scripts/audit.sh

#set permissions for receptionists in script files
#didn't set it for other script files because they recieve r-x 
#permissions recursively from the directory.
setfacl -m g:receptionists:--- scripts/staff-create.sh
setfacl -m g:receptionists:--- scripts/acls.sh
setfacl -m g:receptionists:--- scripts/visit.sh
setfacl -m g:receptionists:--- scripts/audit.sh

#set nurses who are recptionists as unable to execute search scripts
setfacl -m u:lubl2004:--- scripts/search-patient.sh
setfacl -m u:phmc2008:--- scripts/search-patient.sh
setfacl -m u:lubl2004:--- scripts/search-doctor.sh
setfacl -m u:phmc2008:--- scripts/search-doctor.sh

####--patients--####
#pbasicinfo.log
cd patients
for d in */; do
setfacl -m g:doctors:rwx $d
cd ${d}
setfacl -m g:doctors:r-- pbasicinfo.log
setfacl -m g:nurses:r-- pbasicinfo.log
setfacl -m g:receptionists:rw- pbasicinfo.log
setfacl -m g:nurses:r-- pmedicalrecord.log
cd ..
done
cd ..
#receptionist perms for patient directory so receptionist can write 
setfacl -m g:receptionists:rwx patients

#setting registered doctors permission (this way is faulty
#and not robust but this is how I managed it)
#setting doctors permissions for masood
setfacl -m u:mate1997:rwx patients/mi23122001
#setting doctors permissions for David
setfacl -m u:mada1993:rwx patients/dt08031993
#setting doctors permissions for Peter
setfacl -m u:mada1993:rwx patients/pa13091976
setfacl -m u:mate1997:rwx patients/pa13091976
setfacl -m u:brki2018:rwx patients/pa13091976
#setting doctor permissions for Lucia
setfacl -m u:mate1997:rwx patients/ly11091980
setfacl -m u:brki2018:rwx patients/ly11091980

###---staff---###
#do not need to specify permissions for administrators as 
#they inherit rwx permissions.
cd staff
#setting sbasicinfo.log permissions for doctors dir
cd doctors
for d in */; do
cd ${d}
setfacl -m g:doctors:r-- sbasicinfo.log
setfacl -m g:nurses:r-- sbasicinfo.log
setfacl -m g:receptionists:r-- sbasicinfo.log
cd ..
done 
cd ..
#setting sbasicinfo.log permissions for nurses dir
cd nurses 
for d in */; do
cd ${d}
setfacl -m g:doctors:r-- sbasicinfo.log
setfacl -m g:nurses:r-- sbasicinfo.log
setfacl -m g:receptionists:r-- sbasicinfo.log
cd ..
done 
cd ..
#setting sbasicinfo.log permissions for receptionists dir
cd receptionists
for d in */; do
cd ${d}
setfacl -m g:doctors:r-- sbasicinfo.log
setfacl -m g:nurses:r-- sbasicinfo.log
setfacl -m g:receptionists:r-- sbasicinfo.log
cd ..
done 
cd ..
#setting sbasicinfo.log permissions for administrators dir
cd administrators
for d in */; do
cd ${d}
setfacl -m g:doctors:r-- sbasicinfo.log
setfacl -m g:nurses:r-- sbasicinfo.log
setfacl -m g:receptionists:r-- sbasicinfo.log
cd ..
done 
cd ..


