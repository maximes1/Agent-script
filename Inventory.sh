#!/binbash

# Description: Tis script will check the new install server
#Date: April 2022
# Autor: max@hmail.com
# Modified by: sheva@hmail.com  on 4/8/2022

##CPU ckeck
CPU_N=`nproc`
if [ ${CPU_N} -lt 2 ]
then
echo "CPU check FAILED"
else
echo "CPU check PASS"
fi 

##Memory check
TOTAL_M=`free -m | grep mem | awk '{print$2'`
if [ ${TOTAL_M} -lt 2000 ]
then
echo "Memory check FAILED"
else
echo "Memory check PASS"
fi 

## Check for /etc/group file
if [ -f /etc/group ]
then
echo "File /etc/group exist"
else
echo "file /etc/group missing"
fi 

## Check for /etc/passwd file
if [ -f /etc/passwd ]
then
echo "File /etc/passwd exist"
else
echo "file /etc/passwd missing"
fi 

## Apache app installation verification
if [ -f /etc/httpd ]
then
echo "File /etc/httpd exist"
else
echo "file /etc/httpd missing"
fi 

## Kubernetes app install verification
if [ -f /etc/kubernetes ]
then
echo "File /etc/kubernetes exist"
else
echo "file /etc/kubernetes missing"
fi 

## check user puppet
id puppet 
RC=$?
if [ ${RC} -eq 0 ]
then
echo "User puppet exist"
else
echo "User puppet do not exist"
fi 

## Kernel version
Kernelversion=`uname -r | awk -F"." '{print$1,$2,$3}'`
if [ ${Kernelversion} -ge 3 ]
then
echo "Kernel version check Pass"
else
echo "Kernel version check Failed"
fi 

