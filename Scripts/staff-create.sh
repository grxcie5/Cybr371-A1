#!/bin/bash
#discussed proj code with following students
#Abigail Espejo 300526060
#Rosanne Saparamadu 300530238
#Mehma Siddiqui 300526379

cd ..
cd staff
# adding groups
groupadd administrators
groupadd nurses
groupadd receptionists
groupadd doctors
# DOCTORS
# user Mary Teresa
cd doctors
useradd mate1997
mkdir mate1997
usermod -d /opt/WellingtonClinic/staff/doctors/mate1997 mate1997
usermod -g doctors mate1997
cd mate1997
touch sbasicinfo.log
echo "Mary Teresa,03/08/1953,1997,173 Rnd Street Kelburn,m.theresa@yahoo.com,04528293" > sbasicinfo.log
cd ..
# user Breana Kipling
useradd brki2018
mkdir brki2018
usermod -d /opt/WellingtonClinic/staff/doctors/brki2018 brki2018
usermod -g doctors brki2018
cd brki2018
touch sbasicinfo.log
echo "Breana Kipling,03/08/1991,2018,4548 River Road HugoTown Auckland 5513,szzh8@tempmail.net,071943668" > sbasicinfo.log
cd ..
# Mandy Dannel
useradd mada1993
mkdir mada1993
usermod -d /opt/WellingtonClinic/staff/doctors/mada1993 mada1993
usermod -g doctors mada1993
cd mada1993
touch sbasicinfo.log
echo "Mandy Dannel,15/12/1965,1993,343 Norma Avenue Dayton Napier 6731,mandydl@gmail.com,052637445" > sbasicinfo.log
cd ..
# Lance Bourne
useradd labo2002
mkdir labo2002
usermod -d /opt/WellingtonClinic/staff/doctors/labo2002 labo2002
usermod -g doctors labo2002
cd labo2002
touch sbasicinfo.log
echo "Lance Bourne,07/04/1970,2002,25 Ferguson Street Franklin Greytown 8567,lancb@outlook.com,083736456" > sbasicinfo.log
cd ..
# Nurses
cd ..
cd nurses
# Lucia Blakeley
useradd lubl2004
mkdir lubl2004
usermod -d /opt/WellingtonClinic/staff/nurses/lubl2004 lubl2004
usermod -g nurses -G receptionists lubl2004
cd lubl2004
touch sbasicinfo.log
echo "Lucia Blakeley,11/09/1980,2004,935 Massachusetts Avenue Hamilton 4562,lucyblak@outlook.com,38347463" > sbasicinfo.log
cd ..
#Phil McGraw
useradd phmc2008
mkdir phmc2008
usermod -d /opt/WellingtonClinic/staff/nurses/phmc2008 phmc2008
usermod -g nurses -G receptionists phmc2008
cd phmc2008
touch sbasicinfo.log
echo "Phil McGraw,15/04/1984,2008,45 Razyn Street Petone Lower Hutt 8435,philmcg@gmail.com,02384756" > sbasicinfo.log
cd ..
# RECEPTIONISTS
cd ..
cd receptionists
# Andy Smith
useradd ansm2002
mkdir ansm2002
usermod -d /opt/WellingtonClinic/staff/receptionists ansm2002
usermod -g receptionists ansm2002
cd ansm2002
touch sbasicinfo.log
echo "Andy Smith,13/09/1974,2002,58 Foster avenue Wellington 5011,smith.andy74@gmail.com,07284756" > sbasicinfo.log
cd ..
# ADMINISTRATORS 
cd ..
cd administrators
# Pauline Sanderson
useradd pasa1995
mkdir pasa1995
usermod -d /opt/WellingtonClinic/staff/administrators pasa1995
usermod -g administrators -G sudo,root pasa1995
cd pasa1995
touch sbasicinfo.log
echo "Pauline Sanderson,08/03/1993,1995,2452 Randolph Street Bedford Auckland 7752,paulsand@admins.co.nz,03747543" > sbasicinfo.log
cd ..





