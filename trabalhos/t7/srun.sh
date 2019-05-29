#!/bin/sh

input_file=$1'.c'
output_dir='out'
output_file='./'$output_dir'/'$1
np=$2
run='smpirun'
exec=''


if [ ! -d "$output_dir" ] 
then
    mkdir $output_dir
fi

echo '***** building application *****'
smpicc $input_file -o $output_file
echo '***** application builded  *****'

if [ -z "$2" ] || [ "$2" -eq 0 ] 
then
    exec=$run
else
	exec=$run' -np '$np
fi

if [ ! -z "$3" ] 
then
    exec=$exec' '$3
fi

if [ ! -z "$4" ] 
then
    exec=$exec' '$4
fi

if [ ! -z "$5" ] 
then
    exec=$exec' '$5
fi

if [ ! -z "$6" ] 
then
    exec=$exec' '$6
fi

exec=$exec' '$output_file

if [ ! -z "$7" ] 
then
    exec=$exec' '$7
fi

if [ ! -z "$8" ] 
then
    exec=$exec' '$8
fi

if [ ! -z "$9" ] 
then
    exec=$exec' '$9
fi

echo $exec
$exec
