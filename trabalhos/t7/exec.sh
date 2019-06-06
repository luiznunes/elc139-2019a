#!/bin/bash

input_file=$1'.c'
output_dir='out'
output_file='./'$output_dir'/'$1
hspeed=100000000000

if [ ! -d "$output_dir/results" ] 
then
    mkdir -p $output_dir'/results'
fi

smpicc avg.c -o out/avg

for i in {16,32,64,128,256,512,1024}
do
	lat=1000us
	bw=$i'Bps'
	speed=1Gf
	echo -e '<?xml version="1.0"?>\n<!DOCTYPE platform SYSTEM "http://simgrid.gforge.inria.fr/simgrid/simgrid.dtd">\n<platform version="4.1">\n    <zone id="AS0" routing="Full">\n        <cluster id="my_cluster" prefix="host-" suffix=".ufsm.br" radical="0-255" speed="'$speed'" bw="'$bw'" lat="'$lat'"/>\n    </zone>\n</platform>' > cluster_crossbar.xml
	
	for n in {2,4,6,8,10,20,60,160,256}
	do	
		if [ ! -d "$output_dir/results/"$n ] 
		then
    		mkdir -p $output_dir'/results/'$n
		fi

		echo '' > $output_dir'/results/'$n'/'$1'-np='$n'-'$speed'-'$bw'-'$lat'-'$hspeed'.txt'

		for k in {1..10}
		do
			smpirun -np $n -hostfile cluster_hostfile.txt -platform cluster_crossbar.xml $output_file --cfg=smpi/host-speed:$hspeed --cfg=smpi/coll_selector:ompi >> $output_dir'/results/'$n'/'$1'-np='$n'-'$speed'-'$bw'-'$lat'-'$hspeed'.txt'
		done
	done
done

for i in {16,32,64,128,256,512,1024}
do
	lat=2000us
	bw=$i'Bps'
	speed=1Gf
	echo -e '<?xml version="1.0"?>\n<!DOCTYPE platform SYSTEM "http://simgrid.gforge.inria.fr/simgrid/simgrid.dtd">\n<platform version="4.1">\n    <zone id="AS0" routing="Full">\n        <cluster id="my_cluster" prefix="host-" suffix=".ufsm.br" radical="0-255" speed="'$speed'" bw="'$bw'" lat="'$lat'"/>\n    </zone>\n</platform>' > cluster_crossbar.xml
	
	for n in {2,4,6,8,10,20,60,160,256}
	do	
		if [ ! -d "$output_dir/results/"$n ] 
		then
    		mkdir -p $output_dir'/results/'$n
		fi

		echo '' > $output_dir'/results/'$n'/'$1'-np='$n'-'$speed'-'$bw'-'$lat'-'$hspeed'.txt'

		for k in {1..10}
		do
			smpirun -np $n -hostfile cluster_hostfile.txt -platform cluster_crossbar.xml $output_file --cfg=smpi/host-speed:$hspeed --cfg=smpi/coll_selector:ompi >> $output_dir'/results/'$n'/'$1'-np='$n'-'$speed'-'$bw'-'$lat'-'$hspeed'.txt'
		done
	done
done

for i in {16,32,64,128,256,512,1024}
do
	lat=3000us
	bw=$i'Bps'
	speed=1Gf
	echo -e '<?xml version="1.0"?>\n<!DOCTYPE platform SYSTEM "http://simgrid.gforge.inria.fr/simgrid/simgrid.dtd">\n<platform version="4.1">\n    <zone id="AS0" routing="Full">\n        <cluster id="my_cluster" prefix="host-" suffix=".ufsm.br" radical="0-255" speed="'$speed'" bw="'$bw'" lat="'$lat'"/>\n    </zone>\n</platform>' > cluster_crossbar.xml
	
	for n in {2,4,6,8,10,20,60,160,256}
	do	
		if [ ! -d "$output_dir/results/"$n ] 
		then
    		mkdir -p $output_dir'/results/'$n
		fi

		echo '' > $output_dir'/results/'$n'/'$1'-np='$n'-'$speed'-'$bw'-'$lat'-'$hspeed'.txt'

		for k in {1..10}
		do
			smpirun -np $n -hostfile cluster_hostfile.txt -platform cluster_crossbar.xml $output_file --cfg=smpi/host-speed:$hspeed --cfg=smpi/coll_selector:ompi >> $output_dir'/results/'$n'/'$1'-np='$n'-'$speed'-'$bw'-'$lat'-'$hspeed'.txt'
		done
	done
done

for i in {16,32,64,128,256,512,1024}
do
	lat=1000us
	bw=$i'Bps'
	speed=5Gf
	echo -e '<?xml version="1.0"?>\n<!DOCTYPE platform SYSTEM "http://simgrid.gforge.inria.fr/simgrid/simgrid.dtd">\n<platform version="4.1">\n    <zone id="AS0" routing="Full">\n        <cluster id="my_cluster" prefix="host-" suffix=".ufsm.br" radical="0-255" speed="'$speed'" bw="'$bw'" lat="'$lat'"/>\n    </zone>\n</platform>' > cluster_crossbar.xml
	
	for n in {2,4,6,8,10,20,60,160,256}
	do	
		if [ ! -d "$output_dir/results/"$n ] 
		then
    		mkdir -p $output_dir'/results/'$n
		fi

		echo '' > $output_dir'/results/'$n'/'$1'-np='$n'-'$speed'-'$bw'-'$lat'-'$hspeed'.txt'

		for k in {1..10}
		do
			smpirun -np $n -hostfile cluster_hostfile.txt -platform cluster_crossbar.xml $output_file --cfg=smpi/host-speed:$hspeed --cfg=smpi/coll_selector:ompi >> $output_dir'/results/'$n'/'$1'-np='$n'-'$speed'-'$bw'-'$lat'-'$hspeed'.txt'
		done
	done
done

for i in {16,32,64,128,256,512,1024}
do
	lat=2000us
	bw=$i'Bps'
	speed=5Gf
	echo -e '<?xml version="1.0"?>\n<!DOCTYPE platform SYSTEM "http://simgrid.gforge.inria.fr/simgrid/simgrid.dtd">\n<platform version="4.1">\n    <zone id="AS0" routing="Full">\n        <cluster id="my_cluster" prefix="host-" suffix=".ufsm.br" radical="0-255" speed="'$speed'" bw="'$bw'" lat="'$lat'"/>\n    </zone>\n</platform>' > cluster_crossbar.xml
	
	for n in {2,4,6,8,10,20,60,160,256}
	do	
		if [ ! -d "$output_dir/results/"$n ] 
		then
    		mkdir -p $output_dir'/results/'$n
		fi

		echo '' > $output_dir'/results/'$n'/'$1'-np='$n'-'$speed'-'$bw'-'$lat'-'$hspeed'.txt'

		for k in {1..10}
		do
			smpirun -np $n -hostfile cluster_hostfile.txt -platform cluster_crossbar.xml $output_file --cfg=smpi/host-speed:$hspeed --cfg=smpi/coll_selector:ompi >> $output_dir'/results/'$n'/'$1'-np='$n'-'$speed'-'$bw'-'$lat'-'$hspeed'.txt'
		done
	done
done

for i in {16,32,64,128,256,512,1024}
do
	lat=3000us
	bw=$i'Bps'
	speed=5Gf
	echo -e '<?xml version="1.0"?>\n<!DOCTYPE platform SYSTEM "http://simgrid.gforge.inria.fr/simgrid/simgrid.dtd">\n<platform version="4.1">\n    <zone id="AS0" routing="Full">\n        <cluster id="my_cluster" prefix="host-" suffix=".ufsm.br" radical="0-255" speed="'$speed'" bw="'$bw'" lat="'$lat'"/>\n    </zone>\n</platform>' > cluster_crossbar.xml
	
	for n in {2,4,6,8,10,20,60,160,256}
	do	
		if [ ! -d "$output_dir/results/"$n ] 
		then
    		mkdir -p $output_dir'/results/'$n
		fi

		echo '' > $output_dir'/results/'$n'/'$1'-np='$n'-'$speed'-'$bw'-'$lat'-'$hspeed'.txt'

		for k in {1..10}
		do
			smpirun -np $n -hostfile cluster_hostfile.txt -platform cluster_crossbar.xml $output_file --cfg=smpi/host-speed:$hspeed --cfg=smpi/coll_selector:ompi >> $output_dir'/results/'$n'/'$1'-np='$n'-'$speed'-'$bw'-'$lat'-'$hspeed'.txt'
		done
	done
done