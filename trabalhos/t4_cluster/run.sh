#!/bin/sh

input_file=$1'.cpp'
output_file='./out/'$1
omp=$2

echo '***** building application *****'
if [ $omp = true ]; then
  g++ $input_file -o $output_file -fopenmp
else
  g++ $input_file -o $output_file
fi
echo '***** application builded  *****'

# $output_file 512 32 && $output_file 512 64 && $output_file 1024 32 && $output_file 1024 64
$output_file 100 24