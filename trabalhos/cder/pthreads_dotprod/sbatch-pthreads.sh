#!/bin/bash
#SBATCH -J pthreads           # job name
#SBATCH -o pthreads%j.out     # output file name (%j expands to jobID), this file captures standered output from the shell
#SBATCH -e pthreads%j.err     # error file name (%j expands to jobID), this file captures errors generated from the program
#SBATCH  --nodes  1           # total number of nodes requested
#SBATCH --ntasks-per-node 1   # total number of proccess per node.
#SBATCH -p qCDER              # partition --qCDER (to find out available partitions please run 'sinfo' command)
#SBATCH --mem-per-cpu=1000    # request specific amount of RAM per CPU, now since we request 16 cores, the total amount of memory avilable for the program is 48GB

#SBATCH -t 00:10:00           # run time (hh:mm:ss) - 10 minutes
 
 
# execute any program
for nthread in 8 4 2 1
do
  chunk=`expr 1000000 / $nthread`
  srun ./pthreads_dotprod $nthread $chunk 2000
done
