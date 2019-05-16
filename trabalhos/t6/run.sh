#!/bin/sh

input_file=$1'.c'
output_dir='out'
output_file='./'$output_dir'/'$1
np=$2
run=$3
exec=''

if [ -z "$3" ]
then
	run='mpiexec' 
fi

if [ ! -d "$output_dir" ] 
then
    mkdir $output_dir
fi

echo '***** building application *****'
mpicc $input_file -o $output_file
echo '***** application builded  *****'

if [ -z "$2" ] 
then
    exec=$run' '$output_file
else
	exec=$run' -np '$np' '$output_file
fi

if [ ! -z "$4" ] 
then
    exec=$exec' '$4
fi

if [ ! -z "$5" ] 
then
    exec=$exec' '$5
fi


echo $exec
$exec
