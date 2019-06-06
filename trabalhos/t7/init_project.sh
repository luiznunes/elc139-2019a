#!/bin/bash
sudo apt-get update && sudo apt-get install simgrid g++ libboost-all-dev cmake -y
wget http://gforge.inria.fr/frs/download.php/file/37955/SimGrid-3.22.tar.gz && tar -xvf SimGrid-3.22.tar.gz && rm SimGrid-3.22.tar.gz
cd SimGrid-3.22 && cmake -DCMAKE_INSTALL_PREFIX=/usr/local -Denable_smpi=on -Denable_documentation=off && sudo make && sudo make install && cd .. && sudo rm -r SimGrid-3.22/