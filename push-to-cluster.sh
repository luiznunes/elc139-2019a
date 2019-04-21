#!/bin/bash

if [ "$1" == "-r" ]; then
  scp $1 $2 ltheodorico581rs@cderlogin.gsu.edu$3
else
  scp $1 ltheodorico581rs@cderlogin.gsu.edu$2
fi
