


#####   variable existence checking   #####
if [ -z "$NEW_VAR" ]; then
   echo "NEW_VAR does not exist"
fi



#####   file existence checking   #####
if [ ! -f tempfile.txt ];
then
   echo "tempfile.txt file doesn't exist"
fi

#####   block device existence checking   #####
devsdx="/dev/sda"
if [ ! -b $devsdx ];
then
   echo no $devsdx doesnt exist
else
   echo yes $devsdx exists
fi




#####   calculation   #####
echo calculation test
longInt=104857600  # must not use space, i = 0 is wrong
echo $longInt is `expr $longInt / 1024 / 1024` MB...
echo

#####   create and append a data file   #####
echo "create and append a data file"
echo "1,2">datafile.txt
echo "3,4">>datafile.txt
echo "5,6">>datafile.txt
echo
echo "data file is"  
cat datafile.txt
echo

#####   read file to get data input and process using while   #####
echo "read data file test"
IFS=,
i=0  # must not use space, i = 0 is wrong
while read x y; do

   echo i:$i, x:$x, y:$y
   echo loop $i done
   echo 
   ((i++))
done <  datafile.txt
echo


#####   while loop and sleep wait time   #####
COUNTER=0
while [  $COUNTER -lt 3 ]; do
   echo The counter is $COUNTER
   let COUNTER=COUNTER+1 
   echo sleeping  
   sleep 1
done

echo


#####   test script parameter
echo script parameter count is "$#"

parm1="$1"
echo parm1 is $parm1

parm2="$2"
echo parm2 is $parm2


#####   int compare   #####
if [ "$#" -ne 3 ]; then
    echo "input parm count is " "$#" ", less then 3"
fi


##### touch ???




#####   exit the script   #####
exit 1
