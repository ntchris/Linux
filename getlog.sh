config=~/.ssh/someconfig

# $1 is input parm


echo checking /rw/var/dumper folder:
# warning, don't add space
# two ways of getting command output
#corefile=`ssh -F $config root /proc/boot/ls /rw/var/dumper`
#corefile=$(ssh -F $config root /proc/boot/ls /rw/var/dumper)
corefile=$(ssh -F $config root /proc/boot/ls -l /rw/var/dumper)
if [ ! -z "$corefile" ] ;then
  echo "warning!! found possible core dump file: "$corefile
  echo
  echo
  sleep 5s

fi



if [ -z "$1" ];then
  echo "Please give a zip file name for packing device /rw/var."
  echo "example:   getlog.sh output.zip  or getlog.sh output"
  exit 1
fi



if [[ $1!=*.zip ]];
then
   zipfilename=$1".zip"
   echo will create $zipfilename to zip the device folders
fi



#  run this in device to pack the /rw/var, to create a zip file in root folder
#  zip -r /root/drivetest6_log.zip /rw/var
echo "running zip -r /root/$zipfilename /rw/var" ...
ssh -F $config root zip -r /root/$zipfilename /rw/var /jps/mod

ssh -F $config root /proc/boot/ls -l /root/$zipfilename

echo "downloading file $1..."

# getting file from device    
scp -F config  root:/root/$zipfilename $zipfilename

echo "$zipfilename created and downloaded."
ls -l $zipfilename




if [ ! -z "$corefile" ] ;then
  echo "warning!! found possible core dump file: "$corefile
  echo
  echo

fi

