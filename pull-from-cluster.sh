#!/bin/bash

if [ "$1" == "-r" ]; then
  scp $1 ltheodorico581rs@cderlogin.gsu.edu$2 $3
else
  scp ltheodorico581rs@cderlogin.gsu.edu$1 $2
fi
